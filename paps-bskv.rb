require "formula"

class PapsBskv < Formula
  homepage "http://paps.sourceforge.net/"
  url "https://downloads.sourceforge.net/paps/paps-0.6.8.tar.gz"
  sha256 "db214c4ea7ecde2f7986b869f6249864d3ff364e6f210c15aa2824bcbd850a20"

  conflicts_with "paps"

  depends_on "pkg-config" => :build
  depends_on "pango"

  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}",
                          "--disable-debug", "--disable-dependency-tracking"
    system "make", "install"
  end
end

__END__
diff -ru a/src/libpaps.c b/src/libpaps.c
--- a/src/libpaps.c	2014-05-25 14:16:27.000000000 +0200
+++ b/src/libpaps.c	2014-05-25 14:30:53.000000000 +0200
@@ -25,8 +25,8 @@
 
 #include <pango/pango.h>
 #include <pango/pangoft2.h>
-#include <freetype/ftglyph.h>
-#include <freetype/ftoutln.h>
+#include <freetype2/ftglyph.h>
+#include <freetype2/ftoutln.h>
 #include <errno.h>
 #include <stdlib.h>
 #include <stdio.h>
diff -ru a/src/paps.1 b/src/paps.1
--- a/src/paps.1	2014-05-25 14:16:27.000000000 +0200
+++ b/src/paps.1	2014-05-25 14:30:46.000000000 +0200
@@ -61,6 +61,16 @@
 .B \-\-header
 Draw page header for each page.
 .TP
+.B \-\-header\-font=desc
+Set the header font description. Default is Monospace Bold 12.
+.TP
+.B \-\-header\-date\-format=fmt
+Set the header date format. Default is %c (see
+.BR strftime (3)).
+.TP
+.B \-\-header\-rule\-thickness=val
+Set the thickness of the header separation rule. Default is 0 (i.e. as thin as possible).
+.TP
 .B \-\-markup
 Interpret the text as pango markup.
 .TP
diff -ru a/src/paps.c b/src/paps.c
--- a/src/paps.c	2014-05-25 14:16:27.000000000 +0200
+++ b/src/paps.c	2014-05-25 14:30:46.000000000 +0200
@@ -36,6 +36,8 @@
 #define DEFAULT_FONT_SIZE	"12"
 #define HEADER_FONT_FAMILY	"Monospace Bold"
 #define HEADER_FONT_SCALE	"12"
+#define HEADER_DATE_FORMAT	"%c"
+#define HEADER_RULE_THICKNESS 0
 #define MAKE_FONT_NAME(f,s)	f " " s
 
 typedef enum {
@@ -88,6 +90,8 @@
   PangoDirection pango_dir;
   gchar *filename;
   gchar *header_font_desc;
+  gchar *header_date_format;
+  double header_rule_thickness;
   gint lpi;
   gint cpi;
 } page_layout_t;
@@ -283,6 +287,9 @@
   int num_columns = 1;
   int top_margin = 36, bottom_margin = 36, right_margin = 36, left_margin = 36;
   gchar *font = MAKE_FONT_NAME (DEFAULT_FONT_FAMILY, DEFAULT_FONT_SIZE), *encoding = NULL;
+  gchar *header_font_desc = MAKE_FONT_NAME (HEADER_FONT_FAMILY, HEADER_FONT_SCALE);
+  gchar *header_date_format = HEADER_DATE_FORMAT;
+  double header_rule_thickness = HEADER_RULE_THICKNESS;
   page_layout_t page_layout;
   GOptionContext *ctxt = g_option_context_new("[text file]");
   GOptionEntry entries[] = {
@@ -291,6 +298,9 @@
     {"markup", 0, 0, G_OPTION_ARG_NONE, &do_use_markup, "Should the text be considered pango markup? (Default: no)", NULL},
     {"columns", 0, 0, G_OPTION_ARG_INT, &num_columns, "Number of columns output. (Default: 1)", "NUM"},
     {"font", 0, 0, G_OPTION_ARG_STRING, &font, "Set the font description. (Default: Monospace 12)", "DESC"},
+    {"header-font", 0, 0, G_OPTION_ARG_STRING, &header_font_desc, "Set the header font description. (Default: Monospace Bold 12)", "DESC"},
+    {"header-date-format", 0, 0, G_OPTION_ARG_STRING, &header_date_format, "Set the header date format. (Default: %%c)", "DESC"},
+    {"header-rule-thickness", 0, 0, G_OPTION_ARG_DOUBLE, &header_rule_thickness, "Set the thickness of the header separation rule. (Default: 0 (i.e. as thin as possible))", "REAL"},
     {"rtl", 0, 0, G_OPTION_ARG_NONE, &do_rtl, "Do rtl layout.", NULL},
     {"paper", 0, 0, G_OPTION_ARG_CALLBACK, _paps_arg_paper_cb,
      "Choose paper size. Known paper sizes are legal,\n"
@@ -324,7 +334,6 @@
   int do_tumble = -1;   /* -1 means not initialized */
   int do_duplex = -1;
   gchar *paps_header = NULL;
-  gchar *header_font_desc = MAKE_FONT_NAME (HEADER_FONT_FAMILY, HEADER_FONT_SCALE);
   gchar *filename_in, *title, *text;
   int header_sep = 20;
   int max_width = 0, w;
@@ -452,6 +461,8 @@
   page_layout.pango_dir = pango_dir;
   page_layout.filename = filename_in;
   page_layout.header_font_desc = header_font_desc;
+  page_layout.header_date_format = header_date_format;
+  page_layout.header_rule_thickness = header_rule_thickness;
 
   /* calculate x-coordinate scale */
   if (page_layout.cpi > 0.0L)
@@ -1177,7 +1188,7 @@
 
   t = time(NULL);
   tm = *localtime(&t);
-  strftime(date, 255, "%c", &tm);
+  strftime(date, 255, page_layout->header_date_format, &tm);
   header = g_strdup_printf("<span font_desc=\"%s\">%s</span>\n"
                            "<span font_desc=\"%s\">%s</span>\n"
                            "<span font_desc=\"%s\">Page %d</span>",
@@ -1250,9 +1261,10 @@
   /* header separator */
   line_pos = page_layout->page_height - page_layout->top_margin - page_layout->header_height - page_layout->header_sep / 2;
   g_string_append_printf(ps_pages_string,
-                         "%d %f moveto %d %f lineto 0 setlinewidth stroke\n",
+                         "%d %f moveto %d %f lineto %f setlinewidth stroke\n",
                          page_layout->left_margin, line_pos,
-                         page_layout->page_width - page_layout->right_margin, line_pos);
+                         page_layout->page_width - page_layout->right_margin, line_pos,
+                         page_layout->header_rule_thickness);
 
   return logical_rect.height;
 }

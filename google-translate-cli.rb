require 'formula'

class GoogleTranslateCli < Formula
  homepage 'http://www.soimort.org/google-translate-cli/'
  head 'https://github.com/soimort/google-translate-cli.git'

  depends_on 'gawk'

  def patches
    DATA
  end

  def install
    bin.install 'translate.awk' => 'translate'
  end
end

__END__
--- a/translate.awk	2014-02-27 21:29:19.384736574 +0100
+++ b/translate.awk	2014-02-27 21:32:55.247228040 +0100
@@ -1,4 +1,4 @@
-#!/usr/bin/gawk -f
+#!/usr/bin/env gawk -f
 # ----------------------------------------------------------------------------
 # "THE BEER-WARE LICENSE" (Revision 42):
 # <mort.yao@gmail.com> wrote this file. As long as you retain this notice you

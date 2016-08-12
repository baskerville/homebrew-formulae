require "formula"

class MldonkeyBskv < Formula
  homepage "http://mldonkey.sourceforge.net/Main_Page"
  head "https://github.com/ygrek/mldonkey.git", :branch => "next"

  conflicts_with "mldonkey"

  depends_on "autoconf" => :build
  depends_on "pkg-config" => :build
  depends_on "ocaml"
  depends_on "camlp4"
  depends_on "miniupnpc"
  depends_on "libnatpmp"
  depends_on "gd"
  depends_on "libpng"

  def install
    # Fix compiler selection
    ENV["OCAMLC"] = "#{HOMEBREW_PREFIX}/bin/ocamlc.opt -cc #{ENV.cc}"

    system "./configure", "--prefix=#{prefix}", "--enable-minimum", "--enable-upnp-natpmp"
    system "make", "install"
  end
end

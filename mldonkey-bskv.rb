require "formula"

class MldonkeyBskv < Formula
  homepage "http://mldonkey.sourceforge.net/Main_Page"
  url "https://downloads.sourceforge.net/project/mldonkey/mldonkey/3.1.5/mldonkey-3.1.5.tar.bz2"
  sha1 "7bc4f9272ecfe6403eef7062766b26bf321e3015"

  conflicts_with "mldonkey"

  depends_on "pkg-config" => :build
  depends_on "ocaml312"
  depends_on "miniupnpc"
  depends_on "libnatpmp"
  depends_on "gd"
  depends_on :libpng

  def install
    # Fix compiler selection
    ENV["OCAMLC"] = "#{HOMEBREW_PREFIX}/bin/ocamlc.opt -cc #{ENV.cc}"

    system "./configure", "--prefix=#{prefix}", "--enable-minimum", "--enable-upnp-natpmp"
    system "make", "install"
  end
end

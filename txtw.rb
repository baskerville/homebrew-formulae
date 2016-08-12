require "formula"

class Txtw < Formula
  homepage "https://github.com/baskerville/txtw"
  url "https://github.com/baskerville/txtw/archive/0.4.tar.gz"
  sha256 "b7c974ffda5b65421daee8c015f154b2a51daf2d736df841873d9b262c868846"
  head "https://github.com/baskerville/txtw.git"

  depends_on "cairo"

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/txtw", "-v"
  end
end

require "formula"

class Txtw < Formula
  homepage "https://github.com/baskerville/txtw"
  url "https://github.com/baskerville/txtw/archive/0.4.tar.gz"
  sha1 "ba4cbb22295d44f06a3c40e0a923305d84301368"
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

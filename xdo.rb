require "formula"

class Xdo < Formula
  homepage "https://github.com/baskerville/xdo"
  url "https://github.com/baskerville/xdo/archive/0.4.tar.gz"
  sha1 "aacfc71aeb264b608346912b666810f882782b6e"
  head "https://github.com/baskerville/xdo.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/xdo", "-v"
  end
end

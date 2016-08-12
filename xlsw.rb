require "formula"

class Xlsw < Formula
  homepage "https://github.com/baskerville/xlsw"
  url "https://github.com/baskerville/xlsw/archive/0.2.1.tar.gz"
  sha256 "18e71a543afdc49dc765bda8807d71b967709e3734e010c32955dd1a70630371"
  head "https://github.com/baskerville/xlsw.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/xlsw", "-v"
  end
end

require "formula"

class Xlsw < Formula
  homepage "https://github.com/baskerville/xlsw"
  url "https://github.com/baskerville/xlsw/archive/0.2.1.tar.gz"
  sha1 "bb07987aa15a32227d8e9becab50ae54970c94c8"
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

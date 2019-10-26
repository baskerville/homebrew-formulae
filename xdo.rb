require "formula"

class Xdo < Formula
  homepage "https://github.com/baskerville/xdo"
  url "https://github.com/baskerville/xdo/archive/0.5.7.tar.gz"
  sha256 "b661229f0457939d3867cca1664c5671ae959b309feb58abe9142229c8c7ffb4"
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

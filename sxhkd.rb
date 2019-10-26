require "formula"

class Sxhkd < Formula
  homepage "https://github.com/baskerville/sxhkd"
  url "https://github.com/baskerville/sxhkd/archive/0.6.1.tar.gz"
  version "0.6.1"
  sha256 "5f44d623ef6fda01062dcfe8d5d0b75efad9a38114a28983ae895dbcbf43323e"
  head "https://github.com/baskerville/sxhkd.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/sxhkd", "-v"
  end
end

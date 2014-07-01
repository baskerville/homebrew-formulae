require "formula"

class Bspwm < Formula
  homepage "https://github.com/baskerville/bspwm"
  url "https://github.com/baskerville/bspwm/archive/0.8.9.tar.gz"
  sha1 "013a13855fdc19e555dc8e9830938db92dd5c41f"
  head "https://github.com/baskerville/bspwm.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/bspwm", "-v"
  end
end

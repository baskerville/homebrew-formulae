require "formula"

class Bspwm < Formula
  homepage "https://github.com/baskerville/bspwm"
  url "https://github.com/baskerville/bspwm/archive/0.8.8.tar.gz"
  sha1 "df24471169c3b705754fe0dbeeec88165d218038"
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

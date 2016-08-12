require "formula"

class Stest < Formula
  homepage "http://tools.suckless.org/dmenu"
  url "http://git.suckless.org/dmenu/snapshot/dmenu-4.5.tar.bz"
  head "http://git.suckless.org/dmenu", :using => :git
  sha256 "9d52de703e324e6f681ad6c5339a05b8911e65fecf7c0b5f4731c958f728082e"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o stest stest.c"
    bin.install "stest"
    man1.install "stest.1"
  end
end

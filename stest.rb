require "formula"

class Stest < Formula
  homepage "http://tools.suckless.org/dmenu"
  url "http://git.suckless.org/dmenu/snapshot/dmenu-4.5.tar.bz"
  head "http://git.suckless.org/dmenu", :using => :git
  sha1 "a9f4bd4094cd1e78a147286e7372f3b236e76ae0"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o stest stest.c"
    bin.install "stest"
    man1.install "stest.1"
  end
end

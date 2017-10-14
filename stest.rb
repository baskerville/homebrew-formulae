require "formula"

class Stest < Formula
  homepage "http://tools.suckless.org/dmenu"
  url "https://git.suckless.org/dmenu/snapshot/dmenu-4.7.tar.bz2"
  version "4.7"
  head "http://git.suckless.org/dmenu", :using => :git
  sha256 "9b20250abad6f590b4fa2aa310139372ca5d58b882c5bf4385f58a77104509fb"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o stest stest.c"
    bin.install "stest"
    man1.install "stest.1"
  end
end

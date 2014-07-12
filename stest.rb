require "formula"

class Stest < Formula
  homepage "http://tools.suckless.org/dmenu/"
  url "http://git.suckless.org/dmenu/plain/stest.c"
  version "0.1"
  sha1 "2aae4710a28ee151f050b6fcaeb5eb8fad3063bf"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o stest stest.c"
    bin.install "stest"
  end
end

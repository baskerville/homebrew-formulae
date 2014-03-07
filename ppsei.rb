require "formula"

class Ppsei < Formula
  homepage "http://sourceforge.net/projects/ppsei/"
  url "http://downloads.sourceforge.net/ppsei/ppsei-0.3.src.tgz"
  sha1 "e89fe550f2f2c0be39a5426396adf0eba505cd6c"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o ppsei ppsei.c"
    bin.install "ppsei"
  end
end

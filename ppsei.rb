require "formula"

class Ppsei < Formula
  homepage "http://sourceforge.net/projects/ppsei/"
  url "https://downloads.sourceforge.net/ppsei/ppsei-0.3.src.tgz"
  sha256 "addf40591386c1dd2d08d2570ccff5c7beacd6de4e21ded598f57a347e6b001b"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o ppsei ppsei.c"
    bin.install "ppsei"
  end
end

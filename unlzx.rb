require "formula"

class Unlzx < Formula
  homepage "http://xavprods.free.fr/lzx/"
  url "http://aminet.net/misc/unix/unlzx.c.gz"
  version "1.0"
  sha256 "3cfd5dfe34482f91b6fbfc6a5fdd44c7454ce4867061e99cda8aaba628208f7d"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o unlzx unlzx.c"
    bin.install "unlzx"
  end
end

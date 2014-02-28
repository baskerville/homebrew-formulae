require 'formula'

class Unlzx < Formula
  homepage 'http://xavprods.free.fr/lzx/'
  url 'http://aminet.net/misc/unix/unlzx.c.gz'
  version '1.0'
  sha1 '752dd439a30be79da6780683137554db6d84a8a9'

  def install
    system "#{ENV.cc} #{ENV.cflags} -o unlzx unlzx.c"
    bin.install 'unlzx'
  end
end

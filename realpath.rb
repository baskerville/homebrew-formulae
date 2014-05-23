require "formula"

class Realpath < Formula
  homepage "https://github.com/gabraham/SparSNP/"
  url "https://raw.githubusercontent.com/gabraham/SparSNP/master/realpath.c"
  version "1.0"
  sha1 "d67581d59a37c20b03a6969582790878561db4fa"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o realpath realpath.c"
    bin.install "realpath"
  end
end

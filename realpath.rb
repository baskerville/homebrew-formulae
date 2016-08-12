require "formula"

class Realpath < Formula
  homepage "https://github.com/gabraham/SparSNP/"
  url "https://raw.githubusercontent.com/gabraham/SparSNP/master/realpath.c"
  version "1.0"
  sha256 "04957a79872f46a12669b5eee722e8f8d71b7f79be1d3278e3b1ab879ab937ec"

  def install
    system "#{ENV.cc} #{ENV.cflags} -o realpath realpath.c"
    bin.install "realpath"
  end
end

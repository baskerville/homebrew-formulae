require "formula"

class Vanisher < Formula
  homepage "https://github.com/baskerville/vanisher"
  url "https://github.com/baskerville/vanisher/archive/0.1.tar.gz"
  head "https://github.com/baskerville/vanisher.git"
  sha1 "ac89d2c8ea108a7db82ac286ae446b6ff7b441e0"

  def install
    system "make"
    bin.install "vanisher"
  end
end

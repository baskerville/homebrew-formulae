require "formula"

class Vanisher < Formula
  homepage "https://github.com/baskerville/vanisher"
  url "https://github.com/baskerville/vanisher/archive/0.1.tar.gz"
  head "https://github.com/baskerville/vanisher.git"
  sha256 "ec4f6d554c6c3525fa3c977b049381c1c9053a33a0ee9b044caa0e0ce7e78601"

  def install
    system "make"
    bin.install "vanisher"
  end
end

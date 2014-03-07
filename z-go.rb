require "formula"

class ZGo < Formula
  homepage "https://github.com/baskerville/Z"
  url "https://github.com/baskerville/Z/archive/0.5.1.tar.gz"
  sha1 "7b6e7625768841993779f0c9808d7bcedd059381"
  head "https://github.com/baskerville/Z.git"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end
end

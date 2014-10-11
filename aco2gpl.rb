require "formula"

class Aco2gpl < Formula
  homepage "https://github.com/baskerville/aco2gpl"
  url "https://github.com/baskerville/aco2gpl/archive/0.1.tar.gz"
  sha1 "ceed5b0dbfb5afdc04ce06453f63790bbe2aa933"
  head "https://github.com/baskerville/aco2gpl.git"

  def install
    system "make"
    bin.install "aco2gpl"
  end
end

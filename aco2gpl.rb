require "formula"

class Aco2gpl < Formula
  homepage "https://github.com/baskerville/aco2gpl"
  url "https://github.com/baskerville/aco2gpl/archive/0.1.tar.gz"
  sha256 "2f5fb103b782b65d0105f9fe2e53c5710b9fe037e44b2b16db56ddc60be872e5"
  head "https://github.com/baskerville/aco2gpl.git"

  def install
    system "make"
    bin.install "aco2gpl"
  end
end

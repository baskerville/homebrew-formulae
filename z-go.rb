require "formula"

class ZGo < Formula
  homepage "https://github.com/baskerville/Z"
  url "https://github.com/baskerville/Z/archive/0.5.1.tar.gz"
  sha256 "85fccbc6c7dd035af607172cd1a239d26cc804f8dfb6aa8bcc1ca52b99596aff"
  head "https://github.com/baskerville/Z.git"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end
end

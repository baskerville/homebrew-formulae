require "formula"

class Xdo < Formula
  homepage "https://github.com/baskerville/xdo"
  url "https://github.com/baskerville/xdo/archive/0.4.tar.gz"
  sha256 "0b3ac57c6127799d18d27aa58b21d837b96525c6c6ae2f1433dc6d0a371e74ea"
  head "https://github.com/baskerville/xdo.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/xdo", "-v"
  end
end

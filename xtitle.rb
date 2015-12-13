require "formula"

class Xtitle < Formula
  homepage "https://github.com/baskerville/xtitle"
  url "https://github.com/baskerville/xtitle/archive/0.3.tar.gz"
  sha1 "e52b47f6b9e6d5ade1312c19f5b23b6d4ccb041f"
  head "https://github.com/baskerville/xtitle.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/xtitle", "-v"
  end
end

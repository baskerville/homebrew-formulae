require "formula"

class Sxhkd < Formula
  homepage "https://github.com/baskerville/sxhkd"
  url "https://github.com/baskerville/sxhkd/archive/0.5.3.tar.gz"
  sha1 "93b39f453ed80bff49e83595e8fcc0519beeb496"
  head "https://github.com/baskerville/sxhkd.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/sxhkd", "-v"
  end
end

require "formula"

class Sxhkd < Formula
  homepage "https://github.com/baskerville/sxhkd"
  url "https://github.com/baskerville/sxhkd/archive/0.5.9.tar.gz"
  version "0.5.9"
  sha256 "457e0fdfe0a7dac24ca506c026a1e8cde5899073ba1d2ef1326bc68b931648bd"
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

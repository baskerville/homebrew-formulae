require "formula"

class Sxhkd < Formula
  homepage "https://github.com/baskerville/sxhkd"
  url "https://github.com/baskerville/sxhkd/archive/0.5.3.tar.gz"
  sha256 "4f794ecccc03d2ecfc2fef074a09195d16ec7343c514acacf71ffa770ca4a977"
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

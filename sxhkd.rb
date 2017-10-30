require "formula"

class Sxhkd < Formula
  homepage "https://github.com/baskerville/sxhkd"
  url "https://github.com/baskerville/sxhkd/archive/0.5.8.tar.gz"
  version "0.5.8"
  sha256 "d7df48d7d301d1cf06f45172bcfe712510e98dcdbdb896af662cf979f9666855"
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

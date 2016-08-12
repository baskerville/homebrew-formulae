require "formula"

class Bspwm < Formula
  homepage "https://github.com/baskerville/bspwm"
  url "https://github.com/baskerville/bspwm/archive/0.8.9.tar.gz"
  sha256 "750c76132914661d8d5edf7809e9b601977215d31e747dd780c60fd562913d55"
  head "https://github.com/baskerville/bspwm.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/bspwm", "-v"
  end
end

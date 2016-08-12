require "formula"

class Xtitle < Formula
  homepage "https://github.com/baskerville/xtitle"
  url "https://github.com/baskerville/xtitle/archive/0.3.tar.gz"
  sha256 "cadddef1389ba1c5e1dc7dd861545a5fe11cb397a3f692cd63881671340fcc15"
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

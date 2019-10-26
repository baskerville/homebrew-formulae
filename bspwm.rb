require "formula"

class Bspwm < Formula
  homepage "https://github.com/baskerville/bspwm"
  url "https://github.com/baskerville/bspwm/archive/0.9.9.tar.gz"
  sha256 "b1438c3cad13b6101edb31ce8d00ba4ed2f972754e85b90f763e04fa5143c6fc"
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

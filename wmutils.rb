require "formula"

class Wmutils < Formula
  homepage "https://github.com/wmutils/core"
  head "https://github.com/wmutils/core.git"

  depends_on :x11

  def install
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end
end

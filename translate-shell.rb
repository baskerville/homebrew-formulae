require "formula"

class TranslateShell < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.0.7.tar.gz"
  sha1 "58aecf87aa134e3f8366d38ebc16d166ff186cef"
  head "https://github.com/soimort/translate-shell.git"

  depends_on "gawk"

  def install
    system "make"
    bin.install "build/trans"
    man1.install "man/trans.1"
  end
end

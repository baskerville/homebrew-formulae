require "formula"

class TranslateShell < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.3.tar.gz"
  sha1 "e6e415ba56a7116d2c2743c21b93257cc0c1a819"
  head "https://github.com/soimort/translate-shell.git"

  depends_on "gawk"

  def install
    system "make"
    bin.install "build/trans"
    man1.install "man/trans.1"
  end
end

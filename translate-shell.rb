require "formula"

class TranslateShell < Formula
  homepage "http://www.soimort.org/translate-shell"
  url "https://github.com/soimort/translate-shell/archive/v0.9.3.tar.gz"
  sha256 "4513243a0aea812f29a47b5a6c173a45e388513915e6f594a147f84acd2b8fd7"
  head "https://github.com/soimort/translate-shell.git"

  depends_on "gawk"

  def install
    system "make"
    bin.install "build/trans"
    man1.install "man/trans.1"
  end
end

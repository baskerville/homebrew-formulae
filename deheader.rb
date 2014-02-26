require 'formula'

class Deheader < Formula
  homepage 'http://www.catb.org/~esr/deheader'
  url 'http://www.catb.org/~esr/deheader/deheader-0.8.tar.gz'
  sha1 '4527b4675a7b06d728cfa989a3b7844cdf091b40'
  head 'https://git.gitorious.org/deheader/deheader.git'

  depends_on :python

  def install
    man1.install 'deheader.1'
    bin.install 'deheader'
  end
end

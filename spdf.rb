require 'formula'

class Spdf < Formula
  homepage 'https://github.com/examon/spdf'
  head 'https://github.com/examon/spdf.git'

  depends_on :python
  depends_on 'pyPdf' => :python

  def install
    bin.install 'spdf.py' => 'spdf'
  end
end

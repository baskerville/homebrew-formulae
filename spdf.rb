require 'formula'

class Spdf < Formula
  homepage 'https://github.com/baskerville/spdf'
  head 'https://github.com/baskerville/spdf.git'

  depends_on :python
  depends_on 'PyPDF2' => :python

  def install
    bin.install 'spdf.py' => 'spdf'
  end
end

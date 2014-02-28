require 'formula'

class Spdf < Formula
  homepage 'https://github.com/examon/spdf'
  head 'https://github.com/examon/spdf.git'

  depends_on :python

  def install
    bin.install 'spdf.py' => 'spdf'
  end
end

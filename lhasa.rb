require 'formula'

class Lhasa < Formula
  homepage 'http://fragglet.github.io/lhasa/'
  url 'https://github.com/fragglet/lhasa/archive/v0.2.0.tar.gz'
  sha1 '95dae252410648f629b275dedef218f81b835b3b'
  head 'https://github.com/fragglet/lhasa.git'

  depends_on 'pkg-config' => :build
  depends_on :autoconf
  depends_on :automake

  def install

    system './autogen.sh'
    system './configure', "--prefix=#{prefix}"
                          '--disable-dependency-tracking'
    system 'make install'
  end
end

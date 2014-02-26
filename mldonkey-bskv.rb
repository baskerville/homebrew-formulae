require 'formula'

class MldonkeyBskv < Formula
  homepage 'http://mldonkey.sourceforge.net/Main_Page'
  url 'http://downloads.sourceforge.net/project/mldonkey/mldonkey/3.1.3/mldonkey-3.1.3.tar.bz2'
  sha1 '424386f277e84df55a2cbab213fae60787e42c8b'

  option 'with-minimal', 'Disable everything besides eDonkey'

  depends_on 'pkg-config' => :build
  depends_on 'objective-caml'
  depends_on 'gd'
  depends_on :libpng

  # Fix gd detection, there are various upstream tickets referencing this
  def patches
    { :p0 => 'https://trac.macports.org/export/113436/trunk/dports/net/mldonkey/files/patch-config-configure.diff' }
  end

  def install
    # Fix compiler selection
    ENV['OCAMLC'] = "#{HOMEBREW_PREFIX}/bin/ocamlc.opt -cc #{ENV.cc}"

    args = ["--prefix=#{prefix}"]
    args << '--enable-minimum=all' if build.with? 'minimal'

    system './configure', *args
    system 'make install'
  end
end

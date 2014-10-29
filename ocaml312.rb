require "formula"

class Ocaml312 < Formula
  homepage "http://ocaml.org"
  url "http://caml.inria.fr/pub/distrib/ocaml-3.12/ocaml-3.12.0.tar.gz"
  sha1 "37a56d90e49669d73b8468069284dc690085c7ee"
  depends_on :x11

  def install
    args = %W[
      --prefix #{HOMEBREW_PREFIX}
      --mandir #{man}
      -cc #{ENV.cc}
    ]
    args << "-aspp" << "#{ENV.cc} -c"

    ENV.deparallelize # Builds are not parallel-safe, esp. with many cores
    system "./configure", *args
    system "make", "world.opt"
    system "make", "PREFIX=#{prefix}", "install"
    (lib/"ocaml/site-lib").mkpath
  end

  def post_install
    # site-lib in the Cellar will be a symlink to the HOMEBREW_PREFIX location,
    # which is mkpath'd by Keg#link when something installs into it
    (lib/"ocaml").install_symlink HOMEBREW_PREFIX/"lib/ocaml/site-lib"
  end
end

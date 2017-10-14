require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.6.tar.gz"
  version "0.6.0"
  sha256 "258455078dddb5d1327f2d0937164eb92a5c0b7b42d6420cdbffb8a5a44d110c"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

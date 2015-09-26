require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.1.0.tar.gz"
  sha256 "04c210d2a38d15e98d3f3d881a3999448f77f221454691c9131a6ea3f111fb99"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

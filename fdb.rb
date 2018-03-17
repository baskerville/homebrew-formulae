require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.6.1.tar.gz"
  version "0.6.1"
  sha256 "c1eca2ce6f4c8ac5f6cdb897a942a85e2b3ec362d0c9a64ac49efbcc5adee9e3"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

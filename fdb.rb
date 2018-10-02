require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.6.2.tar.gz"
  version "0.6.2"
  sha256 "aa34556a9ab42dede205f5540260e8eacea755abb737eee525aa66bb90ad6067"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

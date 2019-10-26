require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.6.3.tar.gz"
  version "0.6.3"
  sha256 "1d63ab878305217edbe38f18893ccf3e5100701c15a7fa602b1547f2171966e6"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

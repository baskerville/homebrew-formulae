require "formula"

class Fdb < Formula
  homepage "https://github.com/baskerville/fdb"
  url "https://github.com/baskerville/fdb/archive/0.3.2.tar.gz"
  sha256 "462454e0254556b599d86976ee750664aae0369253d2764f8d44f4ed97cba4d4"
  head "https://github.com/baskerville/fdb.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/fdb"
  end
end

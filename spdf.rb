require "formula"

class Spdf < Formula
  homepage "https://github.com/baskerville/spdf"
  head "https://github.com/baskerville/spdf.git"

  depends_on "python@2"
  depends_on "PyPDF2" => :python

  def install
    bin.install "spdf.py" => "spdf"
  end
end

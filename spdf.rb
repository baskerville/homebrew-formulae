require "formula"

class Spdf < Formula
  homepage "https://github.com/baskerville/spdf"
  head "https://github.com/baskerville/spdf.git"

  depends_on "python@2"

  resource "PyPDF2" do
    url "https://files.pythonhosted.org/packages/b4/01/68fcc0d43daf4c6bdbc6b33cc3f77bda531c86b174cac56ef0ffdb96faab/PyPDF2-1.26.0.tar.gz"
    sha256 "e28f902f2f0a1603ea95ebe21dff311ef09be3d0f0ef29a3e44a932729564385"
  end

  def install
    bin.install "spdf.py" => "spdf"
  end
end

class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools"
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/1.0.0"
  sha256 "ceeba995d2319ba2735dd3c613bf145070efb8984886887a9edde7d498354b4b"

  def install
    inreplace 'src/adr-init', '$(dirname $0)', prefix
    inreplace 'src/adr-new', 'ADR_TEMPLATE:-$(dirname $0)/template.md', "ADR_TEMPLATE:-#{prefix}/template.md"

    prefix.install Dir["src/*.md"]
    bin.install Dir["src/*"] - Dir["src/*.md"]
  end

  test do
    system "true"
  end
end

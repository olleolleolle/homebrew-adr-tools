class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools"
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/1.1.0"
  sha256 "858b9f148c61f14525397c9fa2ab060374b3d3d165a57dac8100884de070b517"

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

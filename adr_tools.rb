class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools"
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/2.0.0"
  version "2.0.0"
  sha256 "91305ee2515f619801d90aab2f4bdcc4f696063cc3b89b57b69706446393246f"

  def install
    inreplace 'src/adr-init' do |filename|
      filename.gsub! '$(dirname $0)', prefix
      filename.gsub! "#{prefix}/config.sh", "#{prefix}/bin/config.sh"
      filename.gsub! "$adr_template_dir/init.md", "#{prefix}/init.md"
    end

    %w{
      _adr_commands 
      _adr_dir 
      _adr_file 
      _adr_generate_toc 
      _adr_title 
      _adr_update_status
      adr
      adr-config
      adr-generate 
      adr-help
      adr-list 
      adr-new
      adr-upgrade-repository
    }.each do |filename|
      inreplace "src/#{filename}", '$(dirname $0)/config.sh', "#{prefix}/bin/config.sh"
    end 
    
    inreplace 'src/adr-new', '$adr_template_dir/template.md', "#{prefix}/template.md"

    prefix.install Dir["src/*.md"]
    bin.install Dir["src/*"] - Dir["src/*.md"]
  end

  test do
    system "true"
  end
end

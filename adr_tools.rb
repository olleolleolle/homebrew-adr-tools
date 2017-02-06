class AdrTools < Formula
  desc "A command-line tool for working with Architecture Decision Records (ADRs)."
  homepage "https://github.com/npryce/adr-tools"
  url "https://codeload.github.com/npryce/adr-tools/tar.gz/1.2.0"
  version "1.2.0"
  sha256 "3f45646c099ae996b97c855a9a27ed540e076580eba59c2e8613453b7a67e412"

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
      adr-generate 
      adr-help
      adr-list 
      adr-new
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

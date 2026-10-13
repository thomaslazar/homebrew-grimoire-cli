class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.6.0/grimoire-cli-osx-arm64"
      sha256 "c3f715cdb8b53873acf00b662133156ef93fc709df2fa83e52e7807d2c1b31ea"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.6.0/grimoire-cli-osx-x64"
      sha256 "0a57734058c8ea8b590525ad3d4d1a4a36505193c91102cb11a0d9d3192b773e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.6.0/grimoire-cli-linux-arm64"
      sha256 "5dd47f25b07048d8c0ef664523a22f42b43757daff3306cee6728397756995d3"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.6.0/grimoire-cli-linux-x64"
      sha256 "224d987ff04ba43627ca14c31f700cdda0082da0493c1f66b0a0e55283c32a6e"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "grimoire-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grimoire-cli --version")
  end
end

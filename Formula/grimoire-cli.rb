class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.1/grimoire-cli-osx-arm64"
      sha256 "7df0edf012cc4cc7b4e437450c4d3711ac196abf948d790a998b259b7cb7d586"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.1/grimoire-cli-osx-x64"
      sha256 "c87d34ed6cd6f4835d06398a32841b055b172c1fe6705c575a28e86b0981e1a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.1/grimoire-cli-linux-arm64"
      sha256 "a3e6cfc1492696a9c33f703174f3745a6cbd5fba934f174452c98c44346906ff"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.1/grimoire-cli-linux-x64"
      sha256 "ecfbe7468f93c229e956d4401da2b7017978427c818e4b7afa110a04061e2264"
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

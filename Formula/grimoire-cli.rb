class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.4.0/grimoire-cli-osx-arm64"
      sha256 "9483844bde079634c283fa1fbf7d6f91fa0f200df01333b9b013320f300af5a5"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.4.0/grimoire-cli-osx-x64"
      sha256 "338562f937e662a3c47124b6ac0a5d4b7002926d795469a00deadb176bdb3971"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.4.0/grimoire-cli-linux-arm64"
      sha256 "4d6626852665104ef6ae2eda61dfe41ea1b5ec320b80b1314745a6434d77b3f7"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.4.0/grimoire-cli-linux-x64"
      sha256 "9e193edc2e433963785019d8ccf44b85154c58197867fd80462a4fbdd2bd191e"
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

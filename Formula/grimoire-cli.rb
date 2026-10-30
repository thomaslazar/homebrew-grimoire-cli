class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.3/grimoire-cli-osx-arm64"
      sha256 "bdb741267021e82bb043dc45a91efac53fdbc66bf02512d082b5e122903e8517"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.3/grimoire-cli-osx-x64"
      sha256 "f9040b3f3b6db943834337fbd9279c9e8a4f4e387fe0b500a181361ee5b071ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.3/grimoire-cli-linux-arm64"
      sha256 "2dd1e208ede6567f09e1a40ad040ed52c6d5ccaf6e66237cb1e03162355d4c19"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.3/grimoire-cli-linux-x64"
      sha256 "e01d7a9677e157a7dcdd6d8cea0d7c22254141d667702cc39e5c1675ae6da1f4"
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

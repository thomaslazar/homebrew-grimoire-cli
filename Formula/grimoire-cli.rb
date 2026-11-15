class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG and wargame library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.0/grimoire-cli-osx-arm64"
      sha256 "a658403da50d5f0173becf6af69e61eb62167f2d11080956c71c010d93af1236"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.0/grimoire-cli-osx-x64"
      sha256 "63cbafafeda10a94682ab46c4e4bf784a71983437234457c96347d20f15ce71e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.0/grimoire-cli-linux-arm64"
      sha256 "20ce2418a625179cef143a518fe159cb67c628619bfe2da6294551d50282b098"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.0/grimoire-cli-linux-x64"
      sha256 "27d93a930485e8e4e98b1df0a560d1e3d4199e64f190e802664bbd8accf05c3a"
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

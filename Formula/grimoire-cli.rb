class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.5.0/grimoire-cli-osx-arm64"
      sha256 "5e431eb6959fef5a0baaf5126184dd2e60d66e4f752379a6cd8b544b116f8d41"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.5.0/grimoire-cli-osx-x64"
      sha256 "b8038c01bdc05d48ceeec266bc3f5813debe0b8d253a1b7e0d54359c9165cb65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.5.0/grimoire-cli-linux-arm64"
      sha256 "52fa0c496b7386186f3baf00674c4834af110e3f1929a36460fe9038dd7d93e4"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.5.0/grimoire-cli-linux-x64"
      sha256 "4124d6f52891dae495cad88d128fe4f8d4033a61020758f391b27baf3725eb65"
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

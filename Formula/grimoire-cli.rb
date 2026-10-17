class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.0/grimoire-cli-osx-arm64"
      sha256 "1d214e14c7f376fe24f7ffd7673d976ab69c3fb241122c1fb8429dd08f296af5"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.0/grimoire-cli-osx-x64"
      sha256 "5e2097f510e06ab9c8cb8966707698678bb1d1d2cf9c096e155d2c845e91a7c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.0/grimoire-cli-linux-arm64"
      sha256 "0637a236e82f0b561b91d934ef216c1a266338d45da635367e40d00e58f53830"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.0/grimoire-cli-linux-x64"
      sha256 "fa7b6daa925403834cd65652b600b7d168edd577c2282cc2da4e3c5c5b728440"
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

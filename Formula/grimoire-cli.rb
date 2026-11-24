class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG and wargame library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.1/grimoire-cli-osx-arm64"
      sha256 "87b5410c2f92f54e2d2b2c01e5818fb75d199acfb8d9cba767b3476fd7c62f35"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.1/grimoire-cli-osx-x64"
      sha256 "db9842e89e091ca5cc5f9b8197233371f761f206b1f794bef63127d0c20b24c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.1/grimoire-cli-linux-arm64"
      sha256 "914b4659fc82c8ed3036a7eab52d6f98a825c15c54338c17633dc7651bc1388a"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.8.1/grimoire-cli-linux-x64"
      sha256 "6aed545a7d039f0bb8280936de038092b1fbe2eca76744560ddd08e06a8b69b8"
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

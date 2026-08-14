class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.1.0/grimoire-cli-osx-arm64"
      sha256 "d0c841e9baf1e3fb22a5d4a728b756bddfbe87de450263a6225c14323b50dfd7"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.1.0/grimoire-cli-osx-x64"
      sha256 "1048e958f0650bf9bba1e52753166426bb28ffbe020d60617d791101767fe7a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.1.0/grimoire-cli-linux-arm64"
      sha256 "2cb49216814f654657e4a7e624e8ab2d726f63eacc5a1bb1a89fbd2223e541bd"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.1.0/grimoire-cli-linux-x64"
      sha256 "41e814885d81e1b77adb651a29e2620d17cac172aa822e117f900a4510282146"
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

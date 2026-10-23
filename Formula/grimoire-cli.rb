class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.1/grimoire-cli-osx-arm64"
      sha256 "63483e2ea1a46c939d4bb84431aafb6b09d339812c9b6d6149e9db37acab167b"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.1/grimoire-cli-osx-x64"
      sha256 "7761846f2302fc59a35945a0a7399dd295941e8532e58361ce55ea16f6d154c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.1/grimoire-cli-linux-arm64"
      sha256 "1db8d3ac038a19b2a2180792a2a03bd2f9cdc8907b7ed89925dffe610e4b6ad6"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.1/grimoire-cli-linux-x64"
      sha256 "1893569950a3be8f173924db45d2b311dbea63fcf0094c7ba154f8c7037b39c0"
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

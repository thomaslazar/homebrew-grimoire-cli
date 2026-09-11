class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.0/grimoire-cli-osx-arm64"
      sha256 "e2ea7e257ac1f3fee9b801a8af00c2d7d28a4fac2fcbf93cb144ec012c6f2b80"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.0/grimoire-cli-osx-x64"
      sha256 "219dfa01f8165c0e35843c979f85af328299a9568e24462562853199c89c9840"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.0/grimoire-cli-linux-arm64"
      sha256 "b6fcbe093972386eb77b1f64e5040ed113cf6e7c66fbd6faa4d2bf156747e67a"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.0/grimoire-cli-linux-x64"
      sha256 "a1b74502ee18f0761e9bef7ad1e32b4ccf652d7cfd6f5c8fcabe27d2ff4879c7"
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

class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.4/grimoire-cli-osx-arm64"
      sha256 "530eb983266a661abd10214821b4aa1d7fd287a4f97c49aecba90af85f9d4a11"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.4/grimoire-cli-osx-x64"
      sha256 "0943fafc2060980f924e48516d25d9d6daf92df8ba6ae06f4446a817514f6ed0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.4/grimoire-cli-linux-arm64"
      sha256 "313e38c76fd9144906f4fc25e109a0e13a6f0c1ccfd9e0c1cf53cc7c93288f56"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.4/grimoire-cli-linux-x64"
      sha256 "dba3e3f2fa7d1ba1c5c9b414c7ebdbe0ec4e51c58276e118b47c77b2ef5328fb"
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

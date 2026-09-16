class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.1/grimoire-cli-osx-arm64"
      sha256 "f46f295cc8ec336b8cc5da4120607044d8a7385de17212faca08699f431d0cf9"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.1/grimoire-cli-osx-x64"
      sha256 "4824bf0d63651792d403f559cf8a14ac702ed4537f3f25e2b9c30f0ba1e875d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.1/grimoire-cli-linux-arm64"
      sha256 "567d30a151bf5c3efb63bd03c1f38cc60a053edb0399f705e59cca8e4bb958e0"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.2.1/grimoire-cli-linux-x64"
      sha256 "a4a39a019ac278b12c3a31ecc23b0aaddc0ac1c3fb5f1eb7639248ada3fbd967"
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

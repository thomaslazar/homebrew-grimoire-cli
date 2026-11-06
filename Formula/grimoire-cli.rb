class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.5/grimoire-cli-osx-arm64"
      sha256 "841497f422071c846af7b96df16bcfc681e33f0e88aa28a5406fa24cded884a1"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.5/grimoire-cli-osx-x64"
      sha256 "ac9a3436cbf62be648d6c127108f9ef21602b58688cde0390e8438a18b2e1bc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.5/grimoire-cli-linux-arm64"
      sha256 "e98940d25e0c87fc417586b3854a66dfac7d20f2087c64a7c9af479488fb0c74"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.5/grimoire-cli-linux-x64"
      sha256 "117ec3844873413d1d12cc939610f27af7dcdac63f141aefaf6fb53982716c21"
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

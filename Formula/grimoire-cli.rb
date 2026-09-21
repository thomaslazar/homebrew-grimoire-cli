class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.0/grimoire-cli-osx-arm64"
      sha256 "2e2c074140f4b53dad596173e8924e2f869bb75962ff07643074bb07c6269e70"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.0/grimoire-cli-osx-x64"
      sha256 "0a9540ffa945507437c8f5396dc3135ac006e28aa6650073a7b64e205291e422"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.0/grimoire-cli-linux-arm64"
      sha256 "d973a6b5dfbf15f66a9b75e1ebaf510bbffed83d0dd97b8c730380a2acf68eea"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.3.0/grimoire-cli-linux-x64"
      sha256 "39ed99966c85728ac60aa597a95085101385e214770f7c7f505fa8f9ccdf94e9"
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

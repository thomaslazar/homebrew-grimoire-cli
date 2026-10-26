class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.2/grimoire-cli-osx-arm64"
      sha256 "f4d1f43c79c4a665713f920ff848fb90fa4c8a31a265e33d766888764b65c3b8"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.2/grimoire-cli-osx-x64"
      sha256 "301928273c931b108c0099a14c14049affb9e12193a6272785a2dec2bd4730de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.2/grimoire-cli-linux-arm64"
      sha256 "9f2647d13c856432350edf1ced5225386390f9ed14062f7fd9f7aefb65c6585f"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.2/grimoire-cli-linux-x64"
      sha256 "60c424065a360062415187fbd3353731e3331a071b4a7e2b8b2fdc1403077252"
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

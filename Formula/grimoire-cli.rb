class GrimoireCli < Formula
  desc "Command-line interface for Grimoire, a self-hosted TTRPG library manager"
  homepage "https://github.com/thomaslazar/grimoire-cli"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.6/grimoire-cli-osx-arm64"
      sha256 "b0ec9f16c5965c5ab45b0c3de8311a046b112751382d5ec327b0788b88e35242"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.6/grimoire-cli-osx-x64"
      sha256 "19f50f33784f7ea3adf07d05c3a448c4f282bc9adab63a439090cd5372d5b8a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.6/grimoire-cli-linux-arm64"
      sha256 "ae3133b3f3adaf6ce0ebe968419866f17a5f1bcdae980ee3206594d98da0a203"
    else
      url "https://github.com/thomaslazar/grimoire-cli/releases/download/v0.7.6/grimoire-cli-linux-x64"
      sha256 "196eaa23e8eba14579999260375e56277ba4b82ba8d814c3d5b92fab4ce240c5"
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

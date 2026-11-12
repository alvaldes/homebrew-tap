# Written by update.sh from the checksums of the v1.0.0 release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.0.0/velo-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "89db16eda3ed45ad4d39d1e20b890f95a2a4ebb1a7ab88b4fdc3e45706853ed0"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.0.0/velo-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "d9c8597c4e8ef3a5a5ebcd8a85b30d22199db53369a15c81c87c2e53ea9388a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.0.0/velo-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3532bffbb579ec29381501b42d25dbde2d895d4a0a2cdad8fc8244fc83380853"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.0.0/velo-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "078841ae063a41beeabf85707499ecd0e4ba76a3139238d676e34f61086eda3f"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end

# Written by update.sh from the checksums of the v1.1.0 release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.1.0/velo-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1d8803f1d006dc1ef84f80cd2d4099ccf93d140527de8330e18616dd82516732"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.1.0/velo-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "02d267f540350ccf3e1fe26db193f6422cd99290d051afe4512f2b3f6d92a636"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.1.0/velo-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45401fe343a586d3108545cd5531a67941eedb54d635899eec57a2cbfe34567b"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.1.0/velo-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb242c0055c519c75db37b38b4da9d7d6aacedff7568a926b5d10a861cd20284"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end

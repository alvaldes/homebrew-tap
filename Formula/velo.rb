# Written by update.sh from the checksums of the v0.51.0 release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v0.51.0/velo-v0.51.0-aarch64-apple-darwin.tar.gz"
      sha256 "55b5575d8e7e9219bc8c6ed49db26c084777af311c0fab63c5ca713b8e290093"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v0.51.0/velo-v0.51.0-x86_64-apple-darwin.tar.gz"
      sha256 "dbf94d5b1ae0d668609d0031d86f2becdbf5c33b128d241d712b86b3da4a0ce3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v0.51.0/velo-v0.51.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1b48fb1f92bdbd95d030a0140712a8673ff948e77cb6fa8b71a7be79961ea9f"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v0.51.0/velo-v0.51.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "699f110e08bdcb7b33dfdd7a02b0ab58cf05a7ba0316697cc0760127fff2006d"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end

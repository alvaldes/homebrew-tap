# Written by update.sh from the checksums of the v1.2.0 release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.2.0/velo-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "1cfef5362e53de10024d52bd44e418a461e23c001632f00fef097d9f7e3333f7"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.2.0/velo-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6f7deea4c00d8d2ec5a6d6b852b8718fc2ff35dcc2d44ffad45e9498518a3b22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v1.2.0/velo-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ec0a28454ce00af488a52860549a5369da7fce991be87cfb35d8c9b5a13774f"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v1.2.0/velo-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3876a9231803aebbf051cfea431373286a13712a6b7f67b964ad08a9764c99a"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end

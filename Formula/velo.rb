# Written by update.sh from the checksums of the v0.50.0 release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  version "0.50.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v0.50.0/velo-v0.50.0-aarch64-apple-darwin.tar.gz"
      sha256 "2305760e3971192b3c980d43aa3301502cd35da22cd8fc14d0f0e552c0ceab40"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v0.50.0/velo-v0.50.0-x86_64-apple-darwin.tar.gz"
      sha256 "13afffdbfbf20dfbff275bfa9a3a3e9e1cc078e6f127809961bbfdb5b817e3e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/alvaldes/velo/releases/download/v0.50.0/velo-v0.50.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46dfca532fa2e3a862bb85225ae42c11d731bac0c21a0b57ed890d270c6856d3"
    end
    on_intel do
      url "https://github.com/alvaldes/velo/releases/download/v0.50.0/velo-v0.50.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49e72f3fa67c8d094164f8684385463eb7f1c3dd5ea46653759d2abd1c936619"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end

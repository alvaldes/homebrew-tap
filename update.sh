#!/bin/sh
# Writes Formula/velo.rb for the latest velo release that has all four
# archives and their checksums published. Run by the workflow on a schedule,
# or by hand; it changes nothing when the formula is already current.
#
#   ./update.sh            the latest release
#   ./update.sh v0.46.1    that tag

set -eu

REPO="alvaldes/velo"
TARGETS="aarch64-apple-darwin x86_64-apple-darwin aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu"

fail() {
  echo "update: $1" >&2
  exit 1
}

cd "$(dirname "$0")"

if [ $# -ge 1 ]; then
  tag=$1
else
  url=$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest") ||
    fail "could not reach github.com"
  tag=${url##*/}
fi
case "$tag" in
  v[0-9]*) ;;
  *) fail "'$tag' is not a release tag" ;;
esac
version=${tag#v}

# The checksum of each archive, as CI published it beside the archive. A
# release still being built is missing some: stop without touching anything.
sum_of() {
  line=$(curl -fsSL "https://github.com/$REPO/releases/download/$tag/velo-$tag-$1.tar.gz.sha256") ||
    fail "$tag has no checksum for $1 yet"
  sum=${line%% *}
  [ ${#sum} -eq 64 ] || fail "the checksum for $1 is not a sha256"
  echo "$sum"
}

for target in $TARGETS; do
  sum=$(sum_of "$target")
  case "$target" in
    aarch64-apple-darwin) mac_arm=$sum ;;
    x86_64-apple-darwin) mac_intel=$sum ;;
    aarch64-unknown-linux-gnu) linux_arm=$sum ;;
    x86_64-unknown-linux-gnu) linux_intel=$sum ;;
  esac
done

base="https://github.com/$REPO/releases/download/$tag/velo-$tag"

mkdir -p Formula
cat >Formula/velo.rb.new <<FORMULA
# Written by update.sh from the checksums of the $tag release. Do not edit
# by hand: the next release overwrites it.
class Velo < Formula
  desc "Terminal music player in one binary: gapless, radio, no daemon"
  homepage "https://alvaldes.github.io/velo/"
  version "$version"
  license "MIT"

  on_macos do
    on_arm do
      url "$base-aarch64-apple-darwin.tar.gz"
      sha256 "$mac_arm"
    end
    on_intel do
      url "$base-x86_64-apple-darwin.tar.gz"
      sha256 "$mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$base-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "$linux_arm"
    end
    on_intel do
      url "$base-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "$linux_intel"
    end
  end

  def install
    bin.install "velo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/velo --version")
  end
end
FORMULA
mv Formula/velo.rb.new Formula/velo.rb
echo "update: Formula/velo.rb is at $tag"

cask "jump" do
  version "1.2.0"
  sha256 "ea64e3de402d641f88d6a342cd556a1bb20ec00466bea52e0fce82c400a01af7"

  url "https://github.com/alvaldes/jump/releases/download/v#{version}/JUMP.dmg"
  name "JUMP"
  desc "Click anything on screen from the keyboard with short labels"
  homepage "https://alvaldes.github.io/jump/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "JUMP.app"

  zap trash: [
    "~/Library/Caches/com.alvaldes.jump",
    "~/Library/Preferences/com.alvaldes.jump.plist",
  ]
end

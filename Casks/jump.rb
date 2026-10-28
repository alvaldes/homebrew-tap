cask "jump" do
  version "1.1.0"
  sha256 "a12326afac643d805f1644c93951755dda03de1fe4b1439dea76ffec43aa2fd5"

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

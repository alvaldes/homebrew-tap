cask "netty" do
  version "1.0.0"
  sha256 "9b1f6de22d873df886aef2736f5f0a1663e114160bb50b85e436af2a0a7db43c"

  url "https://github.com/alvaldes/netty/releases/download/v#{version}/Netty.dmg"
  name "Netty"
  desc "Menu bar app that shows whether your internet connection really works"
  homepage "https://alvaldes.github.io/netty/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Netty.app"

  zap trash: [
    "~/Library/Application Support/Netty",
    "~/Library/Caches/com.alvaldes.netty",
    "~/Library/HTTPStorages/com.alvaldes.netty",
    "~/Library/Preferences/com.alvaldes.netty.plist",
  ]
end

cask "netty" do
  version "1.1.0"
  sha256 "fe7d24d5ecd47c5a335fa1da95645bb1df9b09117d444d9b8cbbcb48b47adf60"

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

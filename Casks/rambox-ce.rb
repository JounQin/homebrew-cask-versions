cask "rambox-ce" do
  version "0.8.0"
  sha256 "c5e93e259344a7b029869bbe7f9d222c141c0f0308fb0a82f6bd3d97f018ef1d"

  url "https://github.com/ramboxapp/community-edition/releases/download/#{version}/Rambox-#{version}-mac-universal.zip",
      verified: "github.com/ramboxapp/community-edition/"
  name "Rambox Community Edition"
  desc "Free and Open Source messaging and emailing app"
  homepage "https://rambox.pro/"

  deprecate! date: "2023-12-17", because: :discontinued

  conflicts_with cask: "rambox"

  app "Rambox.app"

  zap trash: [
    "~/Library/Application Support/CrashReporter/Rambox Helper_*.plist",
    "~/Library/Application Support/CrashReporter/Rambox_*.plist",
    "~/Library/Application Support/Rambox",
    "~/Library/Caches/com.grupovrs.ramboxce.ShipIt",
    "~/Library/Caches/com.grupovrs.ramboxce",
    "~/Library/Caches/com.saenzramiro.rambox",
    "~/Library/Logs/Rambox",
    "~/Library/Preferences/ByHost/com.grupovrs.ramboxce.ShipIt.*.plist",
    "~/Library/Preferences/com.grupovrs.ramboxce.helper.plist",
    "~/Library/Preferences/com.grupovrs.ramboxce.plist",
    "~/Library/Preferences/com.saenzramiro.rambox.helper.plist",
    "~/Library/Preferences/com.saenzramiro.rambox.plist",
    "~/Library/Saved Application State/com.grupovrs.ramboxce.savedState",
    "~/Library/Saved Application State/com.saenzramiro.rambox.savedState",
    "~/Library/WebKit/com.saenzramiro.rambox",
  ]
end

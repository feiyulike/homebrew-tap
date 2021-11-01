cask "betterdummy" do
  version "1.0.7"
  sha256 "f21bbe804f42c31eb7f6dd82ffd3ea855b9a4847b4afb5ba717fdba55f45b7c1"

  url "https://github.com/waydabber/BetterDummy/releases/download/v#{version}/BetterDummy-v#{version}.zip"
  name "BetterDummy"
  desc "Dummy Display for Apple Silicon Macs to achieve custom resolutions"
  homepage "https://github.com/waydabber/BetterDummy"

  app "BetterDummy.app"

  zap trash: [
    "~/Library/Containers/me.waydabber.BetterDummy",
    "~/Library/Application Scripts/me.waydabber.BetterDummy",
  ]
end

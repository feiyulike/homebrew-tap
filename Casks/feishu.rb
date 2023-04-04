require 'open-uri'
require 'json'
cask "feishu" do
  latest=URI.open('https://www.feishu.cn/api/downloads').read
  latest_version = JSON.parse(latest)['versions']['MacOS']['version_number'].split("@V")[1]
  latest_url=JSON.parse(latest)['versions']['MacOS']['download_link']
  sha256 :no_check
  version "#{latest_version}"
  url "#{latest_url}"
  # url latest['versions']

  name "Feishu"
  desc "Project management software"
  homepage "https://www.feishu.cn/"
  
  livecheck do
    url "https://www.feishu.cn/api/downloads"
    regex(%r{/(\h+)/Feishu[._-]darwin[._-]x64[._-]v?(\d+(?:\.\d+)+)[._-]signed\.dmg}i)
    strategy :page_match do |page|
      page.scan(regex)
          .map { |match| "#{match[1]}" }
    end
  end
  conflicts_with cask: "feishu"
  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Lark.app", target: "飞书.app"

  zap trash: [
    # feishu
    "~/Library/Caches/com.bytedance.lark.helper",
    "~/Library/Preferences/com.bytedance.lark.helper.plist",
    # lark
    "~/Library/Caches/com.electron.lark.helper",
    "~/Library/Preferences/com.electron.lark.helper.plist",
    # both
    "~/Library/Caches/com.electron.lark",
    "~/Library/Saved Application State/com.electron.lark.savedState",
  ]
end
require 'open-uri'
require 'json'
cask "ysyy" do
  latest=URI.open('https://app.cctv.com/').read.match(/pcDown[\s\S]*(https:\/\/.*.zip)"[\s]*class="mac"/)[1]
  puts latest
  sha256 :no_check
  version "#{latest_version}"
  url "#{latest_url}"
  # url latest['versions']

  name "ysyy"
  desc "cctv video app"
  homepage "https://www.cctv.com"
  
  livecheck do
    url "https://www.feishu.cn/api/downloads"
    regex(%r{/(\h+)/Feishu[._-]darwin[._-]x64[._-]v?(\d+(?:\.\d+)+)[._-]signed\.dmg}i)
    strategy :page_match do |page|
      page.scan(regex)
          .map { |match| "#{match[1]}" }
    end
  end
  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "央视影音.app"

  zap trash: [
    # # feishu
    # "~/Library/Caches/com.bytedance.lark.helper",
    # "~/Library/Preferences/com.bytedance.lark.helper.plist",
    # # lark
    # "~/Library/Caches/com.electron.lark.helper",
    # "~/Library/Preferences/com.electron.lark.helper.plist",
    # # both
    # "~/Library/Caches/com.electron.lark",
    # "~/Library/Saved Application State/com.electron.lark.savedState",
  ]
end
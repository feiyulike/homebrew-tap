cask "iqiyi" do
  version "latest"
  sha256 :no_check

  url do
    pattern = /<a\s+class=".*?\bdl-installer\b.*?"\s+href="([\w:\/\.\-]+)"/
    latest = curl("https://app.iqiyi.com/mac/player/index.html").match(regex).captures.first
    latest
  end
  name "爱奇艺视频"
  desc "Interactive media player"
  homepage "https://www.iqiyi.com/"

  livecheck do
    url "https://app.iqiyi.com/mac/player/index.html"
    strategy :page_match
    regex(/.*最新版本：([\d.]+)/i)
  end

  depends_on macos: ">= :catalina"
  app "爱奇艺.app"

  zap trash: [
    "~/Library/Application Scripts/com.iqiyi.player.QYWidget",
    "~/Library/Application Scripts/com.iqiyi.player",
    "~/Library/Application Scripts/com.iqiyi.player.QYWidget",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.iqiyi.player.sfl*",
    "~/Library/Containers/com.iqiyi.player",
    "~/Library/Containers/com.iqiyi.player.QYWidget",
    "~/Library/Group Containers/group.com.qiyi",
  ]
end

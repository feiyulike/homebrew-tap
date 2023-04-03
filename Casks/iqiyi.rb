require 'open-uri'
cask "iqiyi" do
  version "latest"
  sha256 :no_check

  url do
    pattern = /https:\/\/.*\.dmg/
    url 'https://stc.iqiyipic.com/js/qiyiV2/20230220102415/jobs/pc/appDownloadByMac.js'
    page_content = URI.open(url).read  
    download_link = page_content.match(/https:\/\/.*\.dmg/)[2]
    # latest = curl("https://stc.iqiyipic.com/js/qiyiV2/20230220102415/jobs/pc/appDownloadByMac.js").match(regex)[2]
    download_link
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

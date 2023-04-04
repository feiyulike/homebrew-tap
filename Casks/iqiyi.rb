# encoding: ASCII-8BIT
require 'open-uri'
cask "iqiyi" do
  project=URI.open('https://stc.iqiyipic.com/js/qiyiV2/appDownloadByMac_ver.js').read.match(/projectVersion:"(.*?)"/)[1]
  latest=URI.open("https://stc.iqiyipic.com/js/qiyiV2/#{project}/jobs/pc/appDownloadByMac.js").read.match(/a="(https?:\/\/[\w-]+\.[\w-]+\.[\w-]+\/[^\s]*iQIYIMedia_[^\s]*\.dmg)"/)[1]
  latest_version=URI.open('https://app.iqiyi.com/mac/player/index.html').read.match(/j-mac-version2.*最新版本：([\d.]+)/)[1]
  version "#{latest_version}"
  sha256 :no_check
  url "#{latest}"
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
    "~/Library/Application Scripts/com.iqiyi.player",
    "~/Library/Containers/com.iqiyi.player",
    "~/Library/Group Containers/group.com.qiyi",
  ]
end

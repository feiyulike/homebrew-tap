cask "iqiyi" do
  version "latest"
  url "https://app.iqiyi.com/mac/player/index.html", verified: false

  # 正则表达式，用于匹配class包含dl-installer的a标签的href值
  regex = /<a\s+class=".*?\bdl-installer\b.*?"\s+href="([\w:\/\.\-]+)"/

  # 从url中截取下载链接
  page = URI.open(url.to_s).read
  download_url = page.match(regex).captures.first

  # 配置下载地址
  appcast nil
  name "爱奇艺视频"
  desc "A video player for iQiyi streaming service on Mac"
  homepage "https://www.iqiyi.com/"
  sha256 :no_check
  app "爱奇艺.app"

  # 配置下载链接
  if download_url.include?(".dmg")
    # 如果下载链接是DMG格式，则直接使用url作为下载地址
    installer :manual => "iQiyi-Installer.dmg"
  else
    # 如果下载链接不是DMG格式，则需要使用curl或其他指令下载安装包，并通过zap删除安装包所在目录。
    # 这里的例子是使用curl命令下载安装包。
    installer :script => {
      :executable => "/usr/bin/curl",
      :args => [ "-L", "--retry", "3", "--create-dirs", "--output", "#{staged_path}/iQiyi-Installer.pkg", download_url ]
    },
    :manual => "iQiyi-Installer.pkg"
  end

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

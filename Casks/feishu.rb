cask "feishu" do
  name "Feishu"
  desc "Project management software"
  homepage "https://www.feishu.cn/"
  def install
      bin.install "cmd/brew-rmtree.rb"
  end
    

  auto_updates true

  # Renamed for consistency: app name is different in the Finder and in a shell.
  app "Feishu.app", target: "飞书.app"

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

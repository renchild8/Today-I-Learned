# fastlaneの導入

### bundlerのインストール
```
sudo gem install bundler
```

### Gemfileの作成
```
bundle init
```

### Gemfileを編集
```
vim Gemfile
```

```
# Gemfile
source "https://rubygems.org"

gem "fastlane"
```

### パス指定でGemをインストール
```
bundle install --path vendor/bundler
```

### fastlaneの初期設定
```
bundle exec fastlane init
```

### 何を自動化するかを答える
```
1. 📸  Automate screenshots
2. 👩‍✈️  Automate beta distribution to TestFlight
3. 🚀  Automate App Store distribution
4. 🛠  Manual setup - manually setup your project to automate your tasks
```
今回は4を選択

### fastlane/Fastfileを編集
```
default_platform(:ios)

platform :ios do
  desc "Send a success/error message to your Slack group"
  lane :slackTest do
    slack(
       message: "slack Test !!",
       slack_url: "https://hooks.slack.com/services/XXXXXXXXXXXXX"
   )
  end
end
```

### slackTestを実行
```
bundle exec fastlane slackTest
```
これで通知が来ればOK

# fastlaneの導入

導入したいプロジェクトまで移動
```bash
cd {projectName}
```

### bundlerのインストール(既にあれば不要)
```bash
sudo gem install bundler
```

### Gemfileの作成
```bash
bundle init
```

### Gemfileを編集
```bash
vim Gemfile
```

```
# Gemfile
source "https://rubygems.org"

gem "fastlane"
```

### パス指定でGemをインストール
```bash
bundle install --path vendor/bundler
```

### fastlaneの初期設定
```bash
bundle exec fastlane init
```

### 何を自動化するかを答える
```bash
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
```bash
bundle exec fastlane slackTest
```
これで通知が来ればOK

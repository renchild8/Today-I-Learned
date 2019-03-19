# fastlaneの導入

### bundlerのインストール
```
sudo gem install bundler
```

### fastlaneのインストール
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
gem "cocoapods"
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
# This file contains the fastlane.tools configuration
# You can find the documentation at https://docs.fastlane.tools
#
# For a list of all available actions, check out
#
#     https://docs.fastlane.tools/actions
#
# For a list of all available plugins, check out
#
#     https://docs.fastlane.tools/plugins/available-plugins
#

# Uncomment the line if you want fastlane to automatically update itself
# update_fastlane

default_platform(:ios)

platform :ios do
  desc "Description of what the lane does"
  lane :slackTest do
    slack(
       message: "slack Test !!",
       slack_url: "https://hooks.slack.com/services/XXXXXXXXXXXXX"
   )
  end
end
```


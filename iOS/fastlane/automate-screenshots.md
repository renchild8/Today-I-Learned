# スクリーンショットの自動化

## fastlaneの導入

### bundlerのインストール
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
```
1. 📸  Automate screenshots
2. 👩‍✈️  Automate beta distribution to TestFlight
3. 🚀  Automate App Store distribution
4. 🛠  Manual setup - manually setup your project to automate your tasks
```
今回は1を選択

### fastlane/Fastfileを確認
```
default_platform(:ios)

platform :ios do
  desc "Generate new localized screenshots"
  lane :screenshots do
    capture_screenshots(scheme: "AutomateScreenshots")
  end
end
```

### fastlane/Snapfileを確認
```
# Uncomment the lines below you want to change by removing the # in the beginning

# A list of devices you want to take the screenshots from
# devices([
#   "iPhone 8",
#   "iPhone 8 Plus",
#   "iPhone SE",
#   "iPhone X",
#   "iPad Pro (12.9-inch)",
#   "iPad Pro (9.7-inch)",
#   "Apple TV 1080p"
# ])

# languages([
#   "en-US",
#   "de-DE",
#   "it-IT",
#   ["pt", "pt_BR"] # Portuguese with Brazilian locale
# ])

# The name of the scheme which contains the UI Tests
# scheme("SchemeName")

# Where should the resulting screenshots be stored?
# output_directory("./screenshots")

# remove the '#' to clear all previously generated screenshots before creating new ones
# clear_previous_screenshots(true)

# Arguments to pass to the app on launch. See https://docs.fastlane.tools/actions/snapshot/#launch-arguments
# launch_arguments(["-favColor red"])

# For more information about all available options run
# fastlane action snapshot

```

### プロジェクトの`UITests`内に`SnapshotHelper.swift`を追加

### UITestsクラスのsetUp()にコードを追加

```swift
let app = XCUIApplication()
setupSnapshot(app)
app.launch()
```

### UITestsクラスのtestExample()にコードを追加

```swift
snapshot("testExample")
```

### ターミナルでlaneを実行
```bash
bundle exec fastlane screenshots
```

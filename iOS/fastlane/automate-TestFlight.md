# fastlaneでTestFlightの更新

## 前提条件
TestFlightをXcode経由で更新出来ること

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
今回は2を選択

### AppleIDとパスワードを聞かれるので答える
```
Please enter your Apple ID developer credentials
Apple ID Username:
```

### fastlane/Fastfileを確認
```
default_platform(:ios)

platform :ios do
  desc "Push a new beta build to TestFlight"
  lane :beta do
    build_app(workspace: "JKT48PhotoRally.xcworkspace", scheme: "JKT48PhotoRally")
    upload_to_testflight
  end
end
```

### ターミナルでlaneを実行
```bash
bundle exec fastlane beta
```

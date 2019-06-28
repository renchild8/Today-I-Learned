# Firebase Analytics でイベントログを収集する

## 導入
[イベントをログに記録する  \|  Firebase](https://firebase.google.com/docs/analytics/ios/events?hl=ja)

### 0. Firebase コンソールでアプリを接続する

[Firebase SDK をインストール](https://firebase.google.com/docs/ios/setup?hl=ja)します。  
[Firebase コンソール](https://console.firebase.google.com/?hl=ja)でアプリを Firebase プロジェクトに追加します。


---

### 1. `podfile` に依存関係を追加する。
```
pod 'Firebase/Analytics'
```

### 2. `pod install` を実行して、作成した `.xcworkspace` ファイルを開きます。
```
pod install
```

### 3. `UIApplicationDelegate` で `Firebase` をインポートする。
```
import Firebase
```

### 4. `FirebaseApp` のインスタンスを作成する。
通常は`AppDelegate`の `application:didFinishLaunchingWithOptions:` メソッドで行う。
```
FirebaseApp.configure()
```

### 5. 任意のタイミングでLogEventを送信する。
```
Analytics.logEvent("cusutom_event", parameters: ["custom_parameter1": "hoge" ,"custom_parameter2": 1])
```


### 注意点
- カスタムイベントの反映には時間ががかる。
- リアルタイムで更新されない。
参考 [Google Developers Japan: Firebase Analytics のデータが表示されるまで、どのくらい時間がかかりますか？](https://developers-jp.googleblog.com/2016/12/how-long-does-it-take-for-my-firebase-analytics-data-to-show-up.html)


## デバッグ
[イベントのデバッグ  \|  Firebase](https://firebase.google.com/docs/analytics/debugview?hl=ja#enabling_debug_mode)

1. Xcode で [Product]、[Scheme]、[Edit scheme] の順に選択します。
2. 左側のメニューから [Run] を選択します。
3. [Arguments] タブを選択します。
4. [Arguments Passed On Launch] セクションで -FIRAnalyticsDebugEnabled を追加します。
5. [DebugView](https://console.firebase.google.com/project/_/app/_/debugview?hl=ja)を開く


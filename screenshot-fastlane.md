# fastlaneでスクリーンショットを自動化

### とりあえずinit
```bash
fastlane snapshot init
```

### 生成された`./SnapshotHelper.swift`をUIテストターゲットに追加

ドラッグアンドドロップで追加

### `UITests`クラスの`setUp`メソッドにコードを追加
```
let app = XCUIApplication()
setupSnapshot(app)
app.launch()
```

### 任意のタイミングでスクリーンショットを取る
```
snapshot("01LoginScreen")
```

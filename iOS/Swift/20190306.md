# データの保護

### 準備
Projectファイルの`capabilities`の`Data Protection`を`ON`にする。(`.entitlements`ファイルが生成される)  
参考: https://help.apple.com/xcode/mac/current/#/dev88ff319e7


##### データの保護レベル
- `.noFileProtection`  
データを保護しない  
- `.completeFileProtectionUntilFirstUserAuthentication`  
ユーザーが初めてデバイスのロックを解除するまで保護する(既定値)  
- `.completeFileProtectionUnlessOpen`  
ファイルが開いていない状態で、デバイスがロックされている時は保護する  
- `.completeFileProtection`  
ファイルの状態に関わらず、デバイスがロックされている時は保護する  


### 実装
テキストファイルの作成時、または更新時に`WritingOptions`を付与しデータを保護する。

```Swift
// テキストファイルの作成
func createAndWriteTextFile(fileName: String, text: String) {
    
    // Documentディレクトリのパスを文字列で取得
    guard let documentDirectoryFileURL = URLMaster.Device.documentDirectoryFileURL else { return }
    let fileURLString = documentDirectoryFileURL + fileName
    let fileURL = URL(fileURLWithPath: fileURLString)
    let textData = text.data(using: .utf8)!
    
    do {
        try textData.write(to: fileURL , options: .completeFileProtection)
        
    } catch let error as NSError {
        print("failed to write: \(error)")
        return
    }
    
}
```

```Swift
// ファイルが保護されているかどうか
func isProtectedComplete(fileURL: URL) -> Bool {
    var rsrc: AnyObject?
    do {
        // 指定したファイルのリソースプロパティを取得
        try (fileURL as NSURL).getResourceValue(&rsrc, forKey: .fileProtectionKey)
        
    } catch let error as NSError  {
        print("failed to getResourceValue: \(error)")
        return false
    }
    
    guard let protectionStatus = rsrc as? URLFileProtection else { return false }
    
    return protectionStatus == .complete
}
```

```Swift
// テキストの追記
func appendText(fileURL: URL, text: String) {
    
    do {
        // 指定したファイルのリソースプロパティを設定
        try (fileURL as NSURL).setResourceValue(URLFileProtection.complete, forKey: .fileProtectionKey)
        
    } catch let error as NSError {
        print("failed to file protection: \(error)")
        return
    }
    
    guard isProtectedComplete(fileURL: fileURL) else { return }
    
    do {
        let fileHandle = try FileHandle(forWritingTo: fileURL)
        let stringToWrite = "\n" + text
        fileHandle.seekToEndOfFile()
        fileHandle.write(stringToWrite.data(using: .utf8)!)
    } catch let error as NSError {
        print("failed to append: \(error)")
    }
}
```
参考: https://developer.apple.com/documentation/uikit/core_app/protecting_the_user_s_privacy/encrypting_your_app_s_files


### 注意点
- Simulatorでは動作しない
- ステータスが反映されるのはアプリの初回インストール時(更新では機能しない為、アンインストールが必要)
- iExplorerでは暗号化を確認できない(...たぶん)








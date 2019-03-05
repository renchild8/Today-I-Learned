### アプリ全体でカスタムキーボードを無効化する。

AppDelegateに下記項目を追加
```Swift
func application(_ application: UIApplication, shouldAllowExtensionPointIdentifier extensionPointIdentifier: UIApplication.ExtensionPointIdentifier) -> Bool {
    if extensionPointIdentifier == .keyboard {
        return false
    }
    return true
}
```

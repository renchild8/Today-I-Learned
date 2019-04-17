
```swift
if let url = URL(string: UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(url) {
   UIApplication.shared.open(url, options: [:], completionHandler: nil)
}
```

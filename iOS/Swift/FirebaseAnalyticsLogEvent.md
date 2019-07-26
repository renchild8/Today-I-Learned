```swift
import Firebase

class LogManager {
    func sendLog() {
        Analytics.logEvent("login", parameters: ["user_id" : "renchild8", "job": "Engineer"])
    }
}
```

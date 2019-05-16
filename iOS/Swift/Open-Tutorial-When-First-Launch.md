```Swift
// AppDelegate
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    openTutorialWhenFirstLaunch()

    return true
}

func openTutorialWhenFirstLaunch() {
    let userDefaults = UserDefaults.standard

	// 初期値はfalseになる
    if !userDefaults.bool(forKey: "alreadyLaunch") {
        userDefaults.set(true, forKey: "alreadyLaunch")

        let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TutorialViewController")

        window?.rootViewController = viewController
    }
}
```

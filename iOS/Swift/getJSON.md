1. プロジェクトに `Sample.json` を追加

2. 関数を定義
```swift
func getSampleJSON() -> Data? {

    guard let path = Bundle.main.path(forResource: "Sample", ofType: "json") else { return nil }
    let url = URL(fileURLWithPath: path)

    var jsonData = Data()

    do {
        jsonData = try Data(contentsOf: url)
    } catch let error {
        print("error = \(error)")
        return nil
    }

    return jsonData

}
```

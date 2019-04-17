```swift
extension Collection {
    func find(includeElement: (Self.Iterator.Element) -> Bool) -> Self.Iterator.Element? {
        if let count = index(where: includeElement) { return self[count] }
        return nil
    }
}
```

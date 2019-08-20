```swift
extension UIView {
  func parentView<T: UIView>(type: T.Type) -> T? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let view = nextResponder as? T {
                return view
            }
            parentResponder = nextResponder
        }
    }
}
```

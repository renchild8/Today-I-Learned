```swift
extension UIPageControl {
    func setColor(currentPageColor: UIColor, tintColor: UIColor, borderColor: UIColor, borderWidth: CGFloat) {
        for (pageIndex, dotView) in self.subviews.enumerated() {
            if self.currentPage == pageIndex {
                dotView.backgroundColor = currentPageColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
            } else {
                dotView.backgroundColor = tintColor
                dotView.layer.cornerRadius = dotView.frame.size.height / 2
                dotView.layer.borderColor = borderColor.cgColor
                dotView.layer.borderWidth = borderWidth
            }
        }
    }
}
```

```swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setKeyboardEvent()
    }
    
    func setKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let keyboardInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        scrollView.isScrollEnabled = true
        
        let keyboardSize = keyboardInfo.cgRectValue.size
        self.scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height)
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        scrollView.contentOffset = CGPoint(x: 0, y: -self.scrollView.contentInset.top)
        scrollView.isScrollEnabled = false
    }
}
```

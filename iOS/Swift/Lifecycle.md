```swift
import UIKit

class ViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        print("init(coder:)")
        print("----------ViewControllerが生成されました----------")
        print("")
        super.init(coder: aDecoder)
        // あんま使わん
        
    }
    
    override func viewDidLoad() {
        print("viewDidLoad")
        print("----------viewの読み込みが完了しました----------")
        
        print("safeArea = \(self.view.safeAreaInsets)")
        
        print("")
        
        super.viewDidLoad()
        // 基本的な処理はここに書く
        // viewの読み込みが完了した後に一度だけ呼び出される
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear(_:)")
        print("----------これからviewが表示されます----------")
        
        print("safeArea = \(self.view.safeAreaInsets)")
        
        print("")
        
        super.viewWillAppear(animated)
        // viewが表示される直前に呼び出される
        // 画面遷移し、viewが表示される度に呼び出されるので、更新処理を書くことが多い
        // ただし、モーダルの画面遷移の場合、背面にviewが残っているので呼び出されない
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        print("----------viewが表示されました----------")
        
        print("safeArea = \(self.view.safeAreaInsets)")
        
        print("")
        
        super.viewDidAppear(animated)
        // あんま使わん
        
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
        print("----------これからviewのレイアウトを調節します----------")
        
        print("safeArea = \(self.view.safeAreaInsets)")
        
        print("")
        
        super.viewWillLayoutSubviews()
        // レイアウトを修正したいときに使う
        // safeAreaの取得とか
        
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
        print("----------viewのレイアウトを調節しました----------")
        
        print("safeArea = \(self.view.safeAreaInsets)")
        
        print("")
        
        super.viewDidLayoutSubviews()
        // あんま使わん
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        print("----------これからviewが非表示になります----------")
        print("")
        super.viewWillDisappear(animated)
        // 画面を離れるときに使う
        // 画面内で収めたい処理をここで止める
        // タイマーの停止とか
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
        print("----------viewが非表示になりました----------")
        print("")
        super.viewDidDisappear(animated)
        // あんま使わん
    }
    
    @IBAction func didTapPresent(_ sender: UIButton) {
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            return
        }
        // 画面遷移
        present(viewController, animated: true, completion: nil)
    }
}
```

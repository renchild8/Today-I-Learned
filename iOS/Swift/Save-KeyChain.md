# KeyChainにデータを保存

```Swift
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = KeyChainManager.name.get()
    }

    // 保存
    @IBAction func tappedSaveButton(_ sender: Any) {
        guard let value = textField.text else { return }
        KeyChainManager.name.set(value: value)
    }
    
    // 削除
    @IBAction func tappedDeleteButton(_ sender: Any) {
        KeyChainManager.name.delete()
    }
    
    // 取得
    @IBAction func tappedGetButton(_ sender: Any) {
        nameLabel.text = KeyChainManager.name.get()
    }
    
    

}

```

```Swift
import Foundation

enum KeyChainManager: String {
    
    case name = "name"
    
    // 保存
    func set(value: String) {
        
        let data = value.data(using: .utf8)
        
        guard let _data = data else {
            return
        }
        
        let dic: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                  kSecAttrGeneric as String: self.rawValue,
                                  kSecValueData as String: _data]
        
        var itemAddStatus: OSStatus?
        // 保存データが存在するかの確認
        let matchingStatus = SecItemCopyMatching(dic as CFDictionary, nil)
        if matchingStatus == errSecItemNotFound {
            // 保存
            itemAddStatus = SecItemAdd(dic as CFDictionary, nil)
        } else if matchingStatus == errSecSuccess {
            // 更新
            itemAddStatus = SecItemUpdate(dic as CFDictionary, [kSecValueData as String: _data] as CFDictionary)
        } else {
            print("保存失敗")
        }
        // 保存・更新ステータス確認
        if itemAddStatus == errSecSuccess {
            print("正常終了")
        } else {
            print("保存失敗")
        }
    }
    
    // 削除
    func delete() {
        // 削除するqueryを設定
        let dic: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                  kSecAttrGeneric as String: self.rawValue]
        
        if SecItemDelete(dic as CFDictionary) == errSecSuccess {
            print("削除成功")
        } else {
            print("削除失敗")
        }
    }
    
    // 取得
    func get() -> String? {
        
        let dic: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                  kSecAttrGeneric as String: self.rawValue,
                                  kSecReturnData as String: kCFBooleanTrue]
        
        var data: AnyObject?
        let matchingStatus = withUnsafeMutablePointer(to: &data){
            SecItemCopyMatching(dic as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if matchingStatus == errSecSuccess {
            print("取得成功")
            if let getData = data as? Data,
                let getStr = String(data: getData, encoding: .utf8) {
                return getStr
            }
            print("取得失敗: Dataが不正")
            return nil
        } else {
            print("取得失敗")
            return nil
        }
    }
}

```

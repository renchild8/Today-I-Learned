### UIAlertアラートでパスワードを要求

```Swift
func dispTextformAlert(_ vc:UIViewController, title:String, message:String, completion:@escaping ((_ text: String)->Void)={(_ text: String) -> Void in print("OK")}, recallAction: @escaping (()->Void)={() -> Void in print("Cancel")}) -> Void {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: {
        (action:UIAlertAction!) -> Void in
        let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
        if textFields != nil {
            for textField:UITextField in textFields! {
                //各textにアクセス
                completion(textField.text!)
            }
        }
        
    })
    alert.addAction(okAction)
    
    let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: {
        (action:UIAlertAction!) -> Void in
        recallAction()
    })
    alert.addAction(cancelAction)
    
    alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
        textField.placeholder = "password"
    })
    
    vc.present(alert, animated: true, completion: nil)
}

dispTextformAlert(self, title: "認証", message: "パスワードを入力してください", completion: { ( password ) in
    print(password)
})

```

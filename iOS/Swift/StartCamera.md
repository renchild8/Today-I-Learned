# カメラを起動

```swift
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startCamera() {
        // SourceType.camera：カメラを指定
        let sourceType = UIImagePickerController.SourceType.camera
        
        // カメラが利用可能かどうか
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            // インスタンスの作成
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = sourceType
            imagePickerController.delegate = self
            
            // カメラを起動
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        // カメラを起動
        startCamera()
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    // 撮影が終わったあと
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // imageに撮影した画像が格納される
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        // ImageViewにセット
        self.imageView.image = image
        
        // カメラ画面を閉じる
        self.dismiss(animated: true, completion: nil)
        
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}

```

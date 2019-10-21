
[Azure Face API のセットアップ](https://github.com/renchild8/Today-I-Learned/blob/master/Azure/FaceIdentify.md)

# 環境
macOS Catalina 10.15  
Xcode 11.1  
iOS13  
Swift 5  

# アプリの流れ
初期表示画面  
 ↓  
認証画面へ遷移  
 ↓  
カメラ起動  
 ↓  
顔検出  
 ↓  
画像として取得  
 ↓  
データ型に変換し、検出 `Face - Detect` APIに投げる  
 ↓  
レスポンスの `faceId` を 取得し、識別 `Face - identify` APIに投げる  
 ↓  
レスポンスの `confidence` をチェックし、 9割以上で認証を成功とみなす  
 ↓  
ホーム画面へ遷移  

# 準備
カメラを利用するアプリなので、 `Info.plist` の `Privacy - Camera Usage Description` を有効化してください。

下記ライブラリを利用するため `Podfile` を編集してください。

```
pod 'Moya/RxSwift'
pod 'RxSwift'
pod 'SVProgressHUD'
```

`pod install` を実行してください。

```bash
pod install
```

# APIRequestの実装
初めに `endpoint` や `SubscriptionKey` を `Const` に定義しておきましょう。

```swift
public struct Const {
    static let endpoint = "Your Endpoint"
    static let subscriptionKey = "Your SubscriptionKey"

    static let baseURL = "https://\(endpoint)/face/v1.0/"
    static let personGroupId = "sample_person_group"
}
```

APIリクエストでは [Moya](https://github.com/Moya/Moya) を利用します。

`Moya` を利用するために、まず `Target` を作成します。

```swift
import Moya

enum Target {
    case detect(imageData: Data)
    case identify(faceId: String)
}

extension Target: TargetType {

    var baseURL: URL {
        return URL(string: Const.baseURL)!
    }

    var path: String {
        switch self {
        case .detect:
            return "detect"
        case .identify:
            return "identify"
        }
    }

    var method: Moya.Method {
        switch self {
        case .detect:
            return .post
        case .identify:
            return .post
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .detect(let imageData):

            return .requestCompositeData(bodyData: imageData, urlParameters: ["recognitionModel" : "recognition_02"])

        case .identify(let faceId):
            let parameters: [String: Any] = [
                "personGroupId": Const.personGroupId,
                "faceIds": [faceId]
            ]

            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)

        }

    }

    var headers: [String: String]? {
        var header = [
            "Ocp-Apim-Subscription-Key" : Const.subscriptionKey
        ]

        switch self {
        case .detect:
            header["Content-Type"] = "application/octet-stream"
            return header
        case .identify:
            header["Content-Type"] = "application/json"
            return header
        }
    }

}
```

次は `APIRequest` クラスを作成します。

```swift
import RxSwift
import Moya
import SVProgressHUD

enum Result<ResponseModel: Codable, ErrorResponseModel: Codable> {
    case success(ResponseModel)
    case invalid(ErrorResponseModel)
    case failure(Error)
}

public final class APIRequest {

    private let provider = MoyaProvider<Target>()

    func request<ResponseModel: Codable, ErrorResponseModel: Codable>
        (target: Target, response: ResponseModel.Type, errorResponse: ErrorResponseModel.Type,
         completion: @escaping ((Result<ResponseModel, ErrorResponseModel>) -> Void )) {

        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        provider.request(target) { result in
            SVProgressHUD.dismiss()
            switch result {
            case let .success(response):
                do {
                    let serializedResponse = try response.filterSuccessfulStatusCodes().map(ResponseModel.self)
                    dump(serializedResponse)

                    completion(.success(serializedResponse))

                } catch {
                    guard let errorResponse = self.serializeError(response: response, errorResponse: errorResponse) else { completion(.failure(error)); return }
                    dump(errorResponse)

                    completion(.invalid(errorResponse))

                }
            case let .failure(error):
                dump(error)
                completion(.failure(error))
            }
        }
    }

    private func serializeError<ErrorResponseModel: Codable>
        (response: Moya.Response, errorResponse: ErrorResponseModel.Type) -> ErrorResponseModel? {

        do {
            let errorResponse = try response.map(ErrorResponseModel.self)
            dump(errorResponse)
            return errorResponse
        } catch {
            return nil
        }
    }
}
```

次は、それぞれのAPIのレスポンスモデルを作成します。

```swift
struct FaceDetectResponse: Codable {
    let faceId: String
    let faceRectangle: FaceRectangle
    
    struct FaceRectangle: Codable {
        let top: Int
        let left: Int
        let width: Int
        let height: Int
    }
}

struct FaceIdentifyResponse: Codable {
    let faceId: String
    let candidates: [Candidates]
    
    struct Candidates: Codable {
        let personId: String
        let confidence: Double
    }

}

struct ErrorResponse: Codable {
    public let error: ErrorStatus
    
    struct ErrorStatus: Codable {
        let code: String
        let message: String
    }
}
```
これにてAPIリクエストの部分は完成です。

# Viewの作成
次に `View` を作成します。下の画像を参考に作成してください。

![スクリーンショット 2019-10-20 13.02.49.png](https://user-images.githubusercontent.com/39119676/67232545-8d953a00-f47c-11e9-8fb1-629caf57e782.png)


真ん中のView(FaceAuthView)のViewControllerを作成します。

```swift
import UIKit

class FaceAuthViewController: UIViewController {

    // カメラの映像が映るView
    @IBOutlet private weak var cameraView: UIView!
    // cameraViewに覆いかぶさっているView
    @IBOutlet private weak var overlayView: UIView!
    // overlayViewの中心の透明なView
    @IBOutlet private weak var centerView: UIView!
    // アラートを表示するためのLabel
    @IBOutlet private weak var alertLabel: UILabel!

    // 顔検出を行うクラス
    private var faceDetecer: FaceDetecer?
    // 顔の周りに表示する枠
    private let frameView = UIView()
    // 顔検出されたときの画像
    private var image = UIImage()

    // APIリクエストを行うクラス
    private let apiRequest = APIRequest()

    override func viewDidLoad() {
        setupFrameView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupFaceDetecer()
        dispOverlayView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        if let faceDetecer = faceDetecer {
            faceDetecer.stopRunning()
        }
        faceDetecer = nil
    }

    private func setupFrameView() {
        frameView.layer.borderWidth = 3
        view.addSubview(frameView)
    }
    
    private func setupFaceDetecer() {
        faceDetecer = FaceDetecer(view: cameraView, completion: {faceRect, image in
            self.frameView.frame = faceRect
            self.image = image
            self.isInFrame(faceRect: faceRect)
        })
    }

    private func dispOverlayView() {
        overlayView.isHidden = false
    }

    private func isInFrame(faceRect: CGRect) {

        let xIsInFrame = centerView.frame.minX < faceRect.minX && faceRect.maxX < centerView.frame.maxX
        let yIsInFrame = centerView.frame.minY < faceRect.minY && faceRect.maxY < centerView.frame.maxY

        if xIsInFrame && yIsInFrame {
            stopRunning()
            faceDetect(image: image)
        }

    }

    private func faceDetect(image: UIImage) {

        guard let imageData = image.jpegData(compressionQuality: 1.0) else { return }

        apiRequest.request(target: .detect(imageData: imageData), response: [FaceDetectResponse].self, errorResponse: ErrorResponse.self) { respose in
            switch respose {
            case .success(let faceDetectResponse):

                guard let faceId = faceDetectResponse.first?.faceId else {
                    self.alertLabel.text = "顔認証に失敗しました"
                    self.startRunning()
                    return
                }

                self.faceIdentify(faceId: faceId)

            case .invalid(let errorResponse):
                print(errorResponse)
                self.startRunning()
            case .failure(let error):
                print(error)
                self.startRunning()
            }
        }

    }

    private func faceIdentify(faceId: String) {
        apiRequest.request(target: .identify(faceId: faceId), response: [FaceIdentifyResponse].self, errorResponse: ErrorResponse.self) { respose in
            switch respose {
            case .success(let faceIdentifyResponse):

                // 最初の顔で判定
                guard let candidate = faceIdentifyResponse.first?.candidates.first?.confidence else {
                    self.alertLabel.text = "顔が登録されていません"
                    self.startRunning()
                    return
                }

                let candidateInt = Int(candidate * 100)
                self.alertLabel.text = "信頼度は \(candidateInt)% です"

                if candidate > 0.9 {
                    self.login()
                } else {
                    self.startRunning()
                }

            case .invalid(let errorResponse):
                print(errorResponse)
                self.startRunning()
            case .failure(let error):
                print(error)
                self.startRunning()
            }
        }
    }

    private func startRunning() {
        guard let faceDetecer = faceDetecer else { return }
        faceDetecer.startRunning()
    }

    private func stopRunning() {
        guard let faceDetecer = faceDetecer else { return }
        faceDetecer.stopRunning()
    }

    private func login() {
        self.performSegue(withIdentifier: "gotoHome", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func tappedBackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

```

# 顔検出を行うクラス `FaceDetecer` を作成

```swift
import UIKit
import AVFoundation

final class FaceDetecer: NSObject {
    private let captureSession = AVCaptureSession()
    private var videoDataOutput = AVCaptureVideoDataOutput()
    private var view: UIView
    private var completion: (_ rect: CGRect, _ image: UIImage) -> Void

    required init(view: UIView, completion: @escaping (_ rect: CGRect, _ image: UIImage) -> Void) {
        self.view = view
        self.completion = completion
        super.init()
        self.initialize()
    }

    private func initialize() {
        addCaptureSessionInput()
        registerDelegate()
        setVideoDataOutput()
        addCaptureSessionOutput()
        addVideoPreviewLayer()
        setCameraOrientation()
        startRunning()
    }

    private func addCaptureSessionInput() {
        do {
            guard let frontVideoCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else { return }
            let frontVideoCameraInput = try AVCaptureDeviceInput(device: frontVideoCamera) as AVCaptureDeviceInput
            captureSession.addInput(frontVideoCameraInput)
        } catch let error {
            print(error)
        }
    }

    private func setVideoDataOutput() {
        videoDataOutput.alwaysDiscardsLateVideoFrames = true

        guard let pixelFormatTypeKey = kCVPixelBufferPixelFormatTypeKey as AnyHashable as? String else { return }
        let pixelFormatTypeValue = Int(kCVPixelFormatType_32BGRA)

        videoDataOutput.videoSettings = [pixelFormatTypeKey : pixelFormatTypeValue]
    }

    private func setCameraOrientation() {
        for connection in videoDataOutput.connections where connection.isVideoOrientationSupported {
            connection.videoOrientation = .portrait
            connection.isVideoMirrored = true
        }
    }

    private func registerDelegate() {
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        videoDataOutput.setSampleBufferDelegate(self, queue: queue)
    }

    private func addCaptureSessionOutput() {
        captureSession.addOutput(videoDataOutput)
    }

    private func addVideoPreviewLayer() {
        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.frame = view.bounds
        videoPreviewLayer.videoGravity = .resizeAspectFill

        view.layer.addSublayer(videoPreviewLayer)
    }

    func startRunning() {
        captureSession.startRunning()
    }

    func stopRunning() {
        captureSession.stopRunning()
    }

    private func convertToImage(from sampleBuffer: CMSampleBuffer) -> UIImage? {

        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }

        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))

        let baseAddress = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)
        let width = CVPixelBufferGetWidth(imageBuffer)
        let height = CVPixelBufferGetHeight(imageBuffer)

        let bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = (CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)
        let context = CGContext(data: baseAddress, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)

        guard let imageRef = context?.makeImage() else { return nil }

        CVPixelBufferUnlockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))
        let resultImage = UIImage(cgImage: imageRef)

        return resultImage
    }
}

extension FaceDetecer: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        DispatchQueue.main.sync(execute: {

            guard let image = convertToImage(from: sampleBuffer), let ciimage = CIImage(image: image) else { return }
            guard let detector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]) else { return }
            guard let feature = detector.features(in: ciimage).first else { return }

            sendFaceRect(feature: feature, image: image)

        })
    }

    private func sendFaceRect(feature: CIFeature, image: UIImage) {
        var faceRect = feature.bounds

        let widthPer = view.bounds.width / image.size.width
        let heightPer = view.bounds.height / image.size.height

        // 原点を揃える
        faceRect.origin.y = image.size.height - faceRect.origin.y - faceRect.size.height

        // 倍率変換
        faceRect.origin.x *= widthPer
        faceRect.origin.y *= heightPer
        faceRect.size.width *= widthPer
        faceRect.size.height *= heightPer

        completion(faceRect, image)
    }
}
```

これで実装は終了です。

AzureFaceAPIは無料プランだと1分間に20回までしかリクエストを送れないのでご注意ください。

サンプルアプリはGitHubに公開しています。
https://github.com/renchild8/FaceAuthSample

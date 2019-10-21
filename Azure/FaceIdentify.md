
# 準備
1. Azureアカウントの取得
2. リソースグループの作成
3. リソースの作成
4. `endpoint` , `Subscription key` の取得

※ 詳しい情報は[公式](https://azure.microsoft.com/ja-jp/services/cognitive-services/face/)をご参照ください

# 認証の流れ
検出 `Face - Detect` APIに投げる  
 ↓  
レスポンスの `faceId` を 取得し、識別 `Face - Identify` APIに投げる  

# 認証の準備
認証を行うためには、認証の対象を作る必要があります。  
`Face - Identify` では `PersonGroup` (または `LargePersonGroup` )というグループに対して認証を行います。  
`PersonGroup` とはその名の通りで人のグループです。  
まず `PersonGroup` を作成し、そこに人の情報 `PersonGroup Person` を作成します。  
その後 `PersonGroup Person` に対して、顔の情報を追加します。  
最後に `PersonGroup` をトレーニングすることで認証の対象が作成されます。  

### フロー
`PersonGroup - Create` で `PersonGroup` を作成  
 ↓  
`PersonGroup Person - Create` で `PersonGroup` に `Person` を作成  
 ↓  
`PersonGroup Person - Add Face` で `Person` に `Face` を追加(20枚くらい)  
 ↓  
`PersonGroup - Train` で `PersonGroup` をトレーニングする  

# 認証対象の作成
アプリ側で認証対象を作成するのは面倒なので`cURL`で作成していきます。  
`${ENDPOINT}`と`${SUBSCRIPTION_KEY}`は取得したものに置き換えてください。  

予め `export` しておくとコピペで動かせます。  

```bash
export ENDPOINT=XXXXX_YOUR_ENDPOINT_XXXXX
export SUBSCRIPTION_KEY=XXXXX_YOUR_SUBSCRIPTION_KEY_XXXXX
```

## 1.[PersonGroup - Create ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395244) で `PersonGroup` を作成

`sample_person_group` という `PersonGroup` を作成します。

#### Request URL
https://{endpoint}/face/v1.0/persongroups/{personGroupId}

#### Request parameters
`personGroupId` (必須) : `PersonGroup` のID

#### Request body
`name` (必須) : `PersonGroup`の表示名  
`userData` : ユーザー提供のデータ  
`recognitionModel` : 認識モデル  

##### `recognitionModel`について
`recognition_01`  
Face-Detectのデフォルトの認識モデル。  
2019年3月より前に作成されたすべてのfaceIdは、この認識モデルに結合されます。  

`recognition_02`  
2019年3月にリリースされた認識モデル。  
「recognition_01」と比較して全体的な精度が向上しているため、「recognition_02」をお勧めします。  

今回は `recognition_02` を使用します。  

### サンプル

```bash
curl -X PUT "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Type: application/json" -d "{\"name\":\"SamplePersonGroup\",\"userData\":\"Sample\",\"recognitionModel\":\"recognition_02\"}"
```

```
成功時レスポンスなし
```

ちゃんと作成できているか確認してみましょう。
[PersonGroup - Get ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395246)を利用すると`PersonGroup`の情報を取得できます。

```bash
curl "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group?returnRecognitionModel=true" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}"
```

```json
{
  "recognitionModel": "recognition_02",
  "personGroupId": "sample_person_group",
  "name": "SamplePersonGroup",
  "userData": "Sample"
}
```

## 2.[PersonGroup Person - Create ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f3039523c) で `PersonGroup` に `Person` を作成

作成した `sample_person_group` に `renchild` という `Person` を作成します。

#### Request URL
https://{endpoint}/face/v1.0/persongroups/{personGroupId}/persons

#### Request parameters
`personGroupId` (必須) : `PersonGroup` のID

#### Request body
`name` (必須) : `Person`の表示名  
`userData` : ユーザー提供のデータ  

### サンプル

```bash
curl -X POST "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/persons" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Type: application/json" -d "{\"name\":\"renchild\", \"userData\":\"Sample Person\"}"
```

```json
{
  "personId": "53d462fe-c56b-40f2-b435-5003e5eb0297"
}
```

ちゃんと作成できているか確認してみましょう。
[PersonGroup Person - Get ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f3039523f)を利用すると `Person` の情報を取得できます。

```bash
curl "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/persons/53d462fe-c56b-40f2-b435-5003e5eb0297" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}"
```

```json
{
  "personId": "53d462fe-c56b-40f2-b435-5003e5eb0297",
  "persistedFaceIds": [],
  "name": "renchild",
  "userData": "Sample Person"
}
```

#### 補足 
[PersonGroup Person - List ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395241) を利用すると`PersonGroup`内の`Person`の情報を一覧で取得できます。

```bash
curl "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/persons" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}"
```

```json
[
  {
    "personId": "53d462fe-c56b-40f2-b435-5003e5eb0297",
    "persistedFaceIds": [],
    "name": "renchild",
    "userData": "Sample Person"
  }
]
```

## 3.[PersonGroup Person - Add Face](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f3039523b) で `Person` に `Face` を追加

作成した `renchild` に `Face` を追加します(20枚くらいあるといいらしい)

#### Request URL

https://{endpoint}/face/v1.0/persongroups/{personGroupId}/persons/{personId}/persistedFaces[?userData][&targetFace][&detectionModel]

#### Request parameters
`personGroupId` (必須) : `PersonGroup` のID  
`personId` (必須) : `Person` のID  
`userData` : ユーザー提供のデータ  
`targetFace` : 追加するターゲットの顔を指定するための四角形  
`detectionModel` : 顔検出モデル  

##### `detectionModel`について
`detection_01`  
すべての顔検出操作に対する既定の選択です。  
小さい顔、横顔、不鮮明な顔には最適化されていません。  
検出呼び出しで顔の属性 (頭部姿勢、年齢、感情など) が指定されている場合は、それらを返します。  
検出呼び出しで顔のランドマークが指定されている場合は、それらを返します。  

`detection_02`  
2019 年 5 月にリリースされ、すべての顔検出操作でオプションとして利用可能です。  
小さい顔、横顔、不鮮明な顔での精度が向上しています。  
顔の属性を返しません。  
顔のランドマークを返しません。  

今回は `detection_02` を使用します。  

#### Request body
画像のURLまたは画像のバイナリデータ

### サンプル

```bash
curl -X POST "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/persons/53d462fe-c56b-40f2-b435-5003e5eb0297/persistedFaces?detectionModel=detection_02" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Type: application/octet-stream" --data-binary "@image.jpg" 
```

## 4.[PersonGroup - Train](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395249) で `PersonGroup` をトレーニングする

トレーニングの前に `PersonGroup Person - List` を利用して `PersonGroup` 内の `Person` の情報を確認しましょう。

```bash
curl "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/persons" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}"
```

```json
[
  {
    "personId": "53d462fe-c56b-40f2-b435-5003e5eb0297",
    "persistedFaceIds": [
      "00f850fd-1f68-46ed-a7cc-5c0db171f4cf",
      "3f665c92-a141-4544-818c-36a63b39ac5b",
      "5ce289ec-362e-4be5-8472-18b71674137c",
      "733ceabc-4ef2-4d10-ba57-cfe2ee8ad7b2",
      "751850ac-4d54-4011-8f3c-db2c2b48dbb2",
                    ︙
      "78cdf5f0-e3ea-4cd8-ba4b-eb156a14faf7",
      "7f2a834b-5e9a-4238-a099-8e2cc3c1021e",
      "85d4dc2c-17d0-4f97-9c9d-460b4512dd56",
      "990778dc-be2a-4a1f-9281-21fcb6aa6b7c",
      "a511e64b-8f1b-478e-b83a-753e516a93d9",
      "a735d0e1-26f1-4e50-aafa-9a48a3ff07e0",
      "b40f1ed1-91ea-4e8d-84f7-f113dccc1bbb"
    ],
    "name": "renchild",
    "userData": "Sample Person"
  }
]
```
こんな感じで出ればOKです。

#### `PersonGroup` を トレーニング

#### Request URL
https://{endpoint}/face/v1.0/persongroups/{personGroupId}/train

#### Request parameters
`personGroupId` (必須) : `PersonGroup` のID

#### Request body
なし

### サンプル

```bash
curl -X POST "https://${ENDPOINT}/face/v1.0/persongroups/sample_person_group/train" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Length: 0"
```

```
成功時レスポンスなし
```

これにて認証の準備は完了です。


# 認証

認証を行う際に `faceId` が必要です。  
`faceId` は `Face - Detect` にて生成される顔の特徴の識別子です。  
保存された `faceId` は24時間後に期限切れになり、削除されます。  

※ 先程 `PersonGroup` に登録した `persistedFaceIds` は24時間の制限はなく、永続化されます。  

## [Face - Detect ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395236) で顔を検出する

#### Request URL
https://{endpoint}/face/v1.0/detect[?returnFaceId][&returnFaceLandmarks][&returnFaceAttributes][&recognitionModel][&returnRecognitionModel][&detectionModel]

#### Request parameters
`returnFaceId` : 検出された顔の `faceId` を返すかどうか。デフォルト値は `true`  
`returnFaceLandmarks` : 検出された顔の顔のランドマークを返すかどうか。デフォルト値は `false`  
`returnFaceAttributes` : 年齢、性別、眼鏡、感情 などを分析する属性  
`recognitionModel` : 認識モデル  
`returnRecognitionModel` : `recognitionModel` を返すかどうか。デフォルト値は `false` です。  
`detectionModel` : 顔検出モデル  

`PersonGroup` の作成時に `recognitionModel` を `recognition_02` に指定しているので、  
今回も`recognitionModel` を `recognition_02` に指定します。  

`recognitionModel` が異なる場合 `Face - Identify` にて識別を行うことができなくなります。  

#### Request body
画像のURLまたは画像のバイナリデータ

### サンプル

```bash
curl -X POST "https://${ENDPOINT}/face/v1.0/detect?recognitionModel=recognition_02" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Type: application/octet-stream" --data-binary "@image.jpg" | jq .
```

```json
[
  {
    "faceId": "5e2d9794-3fba-4324-88bd-6ec2944583e0",
    "faceRectangle": {
      "top": 679,
      "left": 667,
      "width": 969,
      "height": 969
    }
  }
]
```

# [Face - Identify ](https://westus.dev.cognitive.microsoft.com/docs/services/563879b61984550e40cbbe8d/operations/563879b61984550f30395239) で顔を識別する

`Face - Detect` で取得した `faceId` で顔の識別を行う

#### Request URL
https://{endpoint}/face/v1.0/identify

#### Request body
`faceIds` (必須) : `Face - Detect` によって作成された `faceId` の配列  
`personGroupId` (※必須) : `PersonGroup - Create` によって作成された `personGroupId`  
`largePersonGroupId` (※必須) : `LargePersonGroup - Create` によって作成された `largePersonGroupId`  
`maxNumOfCandidatesReturned` : 候補者の最大数の範囲。 1〜100の範囲（デフォルトは10）  
`ConfidenceThreshold` : 0~1 の範囲のカスタマイズされた信頼度しきい値  

※ パラメーター `personGroupId` と`largePersonGroupId`を同時に指定しないでください。  

### サンプル

```bash
curl -X POST "https://${ENDPOINT}/face/v1.0/identify" -H "Ocp-Apim-Subscription-Key: ${SUBSCRIPTION_KEY}" -H "Content-Type: application/json" -d "{\"personGroupId\": \"sample_person_group\", \"faceIds\": [\"5e2d9794-3fba-4324-88bd-6ec2944583e0\"]}"
```

```json
[
  {
    "faceId": "5e2d9794-3fba-4324-88bd-6ec2944583e0",
    "candidates": [
      {
        "personId": "53d462fe-c56b-40f2-b435-5003e5eb0297",
        "confidence": 0.93879
      }
    ]
  }
]
```

レスポンスの `confidence` が信頼度です。  
こちらの値を利用して判定を行うことになります。  

[カメラ連携](https://github.com/renchild8/Today-I-Learned/blob/master/iOS/Swift/FaceAuth.md)
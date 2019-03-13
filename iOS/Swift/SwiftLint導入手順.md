SwiftLint導入手順


### 1. CocoaPodsからSwiftLintをインストール

#### 1.1 PodFileを作成
```
platform :ios, '11.0'

target 'sample1' do
  use_frameworks!

  pod 'SwiftLint', '0.29.0'
end
```

#### 1.2 pod installを実行
```bash
$ pod install
```

### 2. ビルド時に自動整形し、静的解析を行うように設定

プロジェクトファイルを選択
→ [Build Phases]タブを選択
→　左上にある[+]をクリックし`New Run Script Phase`をクリック
→　`Run Script`に以下のスクリプトを記述する

```bash
if which "${PODS_ROOT}/SwiftLint/swiftlint" >/dev/null; then
    # 自動整形
    "${PODS_ROOT}/SwiftLint/swiftlint" autocorrect --format
    # 静的解析
    "${PODS_ROOT}/SwiftLint/swiftlint"
else
    echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

### 3. 静的解析のルールを設定

プロジェクトのルートディレクトリに `.swiftlint.yml` を作成し、そのファイルにルールを記述する  
参考: https://github.com/realm/SwiftLint#configuration

静的解析のルールの中には自動整形に対応していないものもある

ルールの詳細
https://github.com/realm/SwiftLint/blob/master/Rules.md

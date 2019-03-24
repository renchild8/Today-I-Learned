# SwiftLintコマンドとそのコマンドオプションの一覧まとめ

```bash
# コマンド一覧の表示
$ swiftlint help

# コマンドオプションの表示
$ swiftlint help <command_name>
```

## コマンド一覧

```bash
# 分析ルールを実行
swiftlint analyze

# 警告とエラーを自動的に修正
swiftlint autocorrect

# 全ルールのドキュメントをmarkdown形式で出力
swiftlint generate-docs

# ヘルプの表示
swiftlint help

# lintの警告とエラーを表示
swiftlint lint

# ルールのリストとその識別子を表示
swiftlint rules

# バージョンを表示
swiftlint version
```

## コマンドオプション一覧

### analyzeコマンドオプション

```bash
# 分析対象のパス
swiftlint analyze --path <path>

# SwiftLintの設定ファイルへのパス
swiftlint analyze --config <config_path>

# warningをerrorとする
swiftlint analyze --strict

# errorをwarningとし、warning閾値を無効にする
swiftlint analyze --lenient

# パスオプションよりも設定ファイルのexcludedを優先する
swiftlint analyze --force-exclude

# SCRIPT_INPUT_FILE 環境変数をファイルとして読み込む
swiftlint analyze --use-script-input-files

# benchmark_files.txtとbenchmark_rules.txtにベンチマーク結果（実行速度）を保存する
swiftlint analyze --benchmark

# エラーと警告を記録するために使用するレポート用パス
swiftlint analyze --reporter <path>

# ログを出力しないようにする
swiftlint analyze --quiet

# whitelist_rules、opt-in、disabledを無視し、全てのルールを適用する
swiftlint analyze [--enable-all-rules]

# 可能な限り違反を修正する
swiftlint analyze　--autocorrect

# AnalyzerRulesをLintするときに使用するxcodebuildログのフルパス
swiftlint analyze　--compiler-log-path <compiler_log_path>
```

### autocorrectコマンドオプション

```bash
# 修正するファイルまたはディレクトリへのパス
swiftlint autocorrect --path <path>

# SwiftLintの設定ファイルへのパス
swiftlint autocorrect --config <config_file>

# SCRIPT_INPUT_FILE 環境変数をファイルとして読み込む
swiftlint autocorrect --use-script-input-file

# ログを出力しないようにする
swiftlint autocorrect --quiet

# パスオプションよりも設定ファイルのexcludedを優先する
swiftlint autocorrect --force-exclude

# Swiftファイルを再フォーマット
swiftlint autocorrect --format

# キャッシュディレクトリのパス
swiftlint autocorrect --cache-path <cache_path>

# キャッシュを利用しない
swiftlint autocorrect --no-cache

# 整形にスペースでなくタブを使う（非推奨）
swiftlint autocorrect --use-tab
```

### generate-docsコマンドオプション

```bash
# ドキュメントを保存する場所のパス。存在しない場合は、出力に表示されます。
swift generate-docs --path <path>
```

### helpコマンドオプション

なし

### lintコマンドオプション

```bash
# Lint対象のパス
swiftlint lint --path <path>

# 標準入力に対してLintをかける
swiftlint lint --use-stdin

# SwiftLintの設定ファイルへのパス
swiftlint lint --config <config_path>

# warningをerrorとする
swiftlint lint --strict

# errorをwarningとし、warning閾値を無効にする
swiftlint lint --lenient

# パスオプションよりも設定ファイルのexcludedを優先する
swiftlint lint --force-exclude

# SCRIPT_INPUT_FILE 環境変数をファイルとして読み込む
swiftlint lint --use-script-input-files

# benchmark_files.txtとbenchmark_rules.txtにベンチマーク結果（実行速度）を保存する
swiftlint lint --benchmark

# エラーと警告を記録するために使用するレポート用パス
swiftlint lint --reporter <path>

# ログを出力しないようにする
swiftlint lint --quiet

# キャッシュディレクトリのパス
swiftlint lint --cache-path <cache_path>

# キャッシュを利用しない
swiftlint lint --no-cache

# whitelist_rules、opt-in、disabledを無視し、全てのルールを適用する
swiftlint lint [--enable-all-rules]
```

### rulesコマンドオプション

```bash
# SwiftLintの設定ファイルへのパス
swiftlint rules --config <config_path>

# 指定した識別子のルールの説明を表示
swiftlint rules <rule_identifier>

# 有効化されたルールのみ表示
swiftlint rules --enabled
swiftlint rules -e

# 無効化されたルールのみ表示
swiftlint rules --disabled
swiftlint rules -d
```

### versionコマンドオプション

なし



|Key|Description|EnvVar|Default|
|------------------------------|------------------------------------------------------------------|-----------------------------------------|-------------------------------------------|
|`workspace`|ワークスペースファイルのパス|SNAPSHOT_WORKSPACE||
|`project`|プロジェクトファイルのパス|SNAPSHOT_PROJECT||
|`xcargs`|"テストフェーズのためにxcodebuildに追加の引数を渡します。<br>設定の名前と値は必ず引用符で囲んでください。<br>例：OTHER_LDFLAGS=""-ObjC-lstdc++"""|SNAPSHOT_XCARGS||
|`xcconfig`|アプリを構築するための追加のXCCONFIGファイルを使う|SNAPSHOT_XCCONFIG||
|`devices`|スクリーンショットを撮りたいデバイスのリスト|||
|`languages`|使いたい言語のリスト||["en-US"]|
|`launch_arguments`|使いたい起動引数のリスト|SNAPSHOT_LAUNCH_ARGUMENTS|[""]|
|`output_directory`|スクリーンショットを保存するディレクトリ|SNAPSHOT_OUTPUT_DIRECTORY|fastlane/screenshots*|
|`output_simulator_logs`|シミュレータでアプリによって生成されたログ（NSLog、perrorなどを使用）をoutput_directoryに書き込む必要があるかどうか|SNAPSHOT_OUTPUT_SIMULATOR_LOGS|false|
|`ios_version`|iOSのバージョン。デフォルトでは、最新のバージョンが自動的に使用されます。|||
|`skip_open_summary`|スナップショット実行後にHTMLサマリーを開かない|SNAPSHOT_SKIP_OPEN_SUMMARY|false|
|`skip_helper_version_check`|SnapshotHelperのバージョンチェックをしない|SNAPSHOT_SKIP_SKIP_HELPER_VERSION_CHECK|false|
|`clear_previous_screenshots`|スナップショットを実行する前に以前に生成されたスクリーンショットを自動的に消去する。|SNAPSHOT_CLEAR_PREVIOUS_SCREENSHOTS|false|
|`reinstall_app`|アプリケーションを実行する前に自動的に再インストールする。|SNAPSHOT_REINSTALL_APP|false|
|`erase_simulator`|アプリケーションを実行する前にシミュレータを自動的に消去する。|SNAPSHOT_ERASE_SIMULATOR|false|
|`localize_simulator`|シミュレータのシステム言語が設定されます。|SNAPSHOT_LOCALIZE_SIMULATOR|false|
|`app_identifier`|アンインストールするアプリのバンドル識別子（reconfig_appを有効にする場合にのみ必要）|SNAPSHOT_APP_IDENTIFIER|デフォルトはプロジェクトのbundleID|
|`add_photos`|アプリケーションを実行する前にシミュレータに追加する必要がある写真のリスト|SNAPSHOT_PHOTOS||
|`add_videos`|アプリケーションを実行する前にシミュレータに追加する必要があるビデオのリスト|SNAPSHOT_VIDEOS||
|`buildlog_path`|ビルドログを保存するディレクトリ|SNAPSHOT_BUILDLOG_PATH|~/Library/Logs/snapshot*|
|`clean`|プロジェクトをビルドする前にクリーンアップする。|SNAPSHOT_CLEAN|false|
|`test_without_building`|ビルドせずにテスト、派生データパスが必要|SNAPSHOT_TEST_WITHOUT_BUILDING||
|`configuration`|アプリをビルドするときに使用する設定。デフォルトは'Release'|SNAPSHOT_CONFIGURATION|*|
|`xcpretty_args`|追加のxcpretty引数|SNAPSHOT_XCPRETTY_ARGS||
|`sdk`|アプリケーションを構築するために使用されるべきSDK|SNAPSHOT_SDK||
|`scheme`|UIテストで使いたいスキーム|SNAPSHOT_SCHEME||
|`number_of_retries`|リトライ回数|SNAPSHOT_NUMBER_OF_RETRIES|1|
|`stop_after_first_error`|1台のデバイスでテストが完全に失敗した直後に停止させる|SNAPSHOT_BREAK_ON_FIRST_ERROR|false|
|`derived_data_path`|データが保存されるディレクトリ|SNAPSHOT_DERIVED_DATA_PATH||
|`result_bundle`|結果バンドルを出力ディレクトリに生成する|SNAPSHOT_RESULT_BUNDLE|false|
|`test_target_name`|テストしたいターゲットの名前|SNAPSHOT_TEST_TARGET_NAME||
|`namespace_log_files`|デバイスごとおよび言語ごとにログファイルを分ける|SNAPSHOT_NAMESPACE_LOG_FILES||
|`concurrent_simulators`|複数のシミュレータで同時にスナップショットを撮ります。注意：このオプションは、Xcode9に対して実行している場合にのみ適用されます。|SNAPSHOT_EXECUTE_CONCURRENT_SIMULATORS|true|
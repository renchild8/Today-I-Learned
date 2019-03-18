# pod installとpod updateの違い

- installはPodfile.lockをみてインストールする
- updateはPodfile.lockをみずにインストールする、さらにPodfile.lockを更新する


# プロジェクトからCocoaPodsを削除する
```
pod deintegrate
pod clean
rm Podfile
```

# Objective-CからSwiftのクラスを参照する


### `hoge.m`ファイルで`[ProjectName]-Swift.h`をインポートする。
```
#import "[HogeProject]-Swift.h"
```
Projectファイルの`Objective-C Generated Interface Header Name`がこれに当たるっぽい

### Point
- 参照するクラスは`NSObject`を継承している必要がある
- クラスに`@objcMembers`を付ける必要がある
```swift
@objcMembers
class Hoge: NSObject {
}
```

# SwiftLintRules

* [Block Based KVO](#block-based-kvo)
* [Class Delegate Protocol](#class-delegate-protocol)
* [Closing Brace Spacing](#closing-brace-spacing)
* [Closure Parameter Position](#closure-parameter-position)
* [Closure Spacing](#closure-spacing)
* [Colon](#colon)
* [Comma Spacing](#comma-spacing)
* [Compiler Protocol Init](#compiler-protocol-init)
* [Control Statement](#control-statement)
* [Custom Rules](#custom-rules)
* [Cyclomatic Complexity](#cyclomatic-complexity)
* [Discarded Notification Center Observer](#discarded-notification-center-observer)
* [Discouraged Direct Initialization](#discouraged-direct-initialization)
* [Dynamic Inline](#dynamic-inline)
* [Empty Enum Arguments](#empty-enum-arguments)
* [Empty Parameters](#empty-parameters)
* [Empty Parentheses with Trailing Closure](#empty-parentheses-with-trailing-closure)
* [Fatal Error Message](#fatal-error-message)
* [File Line Length](#file-line-length)
* [For Where](#for-where)
* [Force Cast](#force-cast)
* [Force Try](#force-try)
* [Force Unwrapping](#force-unwrapping)
* [Function Body Length](#function-body-length)
* [Function Parameter Count](#function-parameter-count)
* [Generic Type Name](#generic-type-name)
* [Identifier Name](#identifier-name)
* [Implicit Getter](#implicit-getter)
* [Implicitly Unwrapped Optional](#implicitly-unwrapped-optional)
* [Inert Defer](#inert-defer)
* [Is Disjoint](#is-disjoint)
* [Large Tuple](#large-tuple)
* [Leading Whitespace](#leading-whitespace)
* [Legacy CGGeometry Functions](#legacy-cggeometry-functions)
* [Legacy Constant](#legacy-constant)
* [Legacy Constructor](#legacy-constructor)
* [Legacy NSGeometry Functions](#legacy-nsgeometry-functions)
* [Line Length](#line-length)
* [Mark](#mark)
* [Multiple Closures with Trailing Closure](#multiple-closures-with-trailing-closure)
* [Nesting](#nesting)
* [No Fallthrough Only](#no-fallthrough-only)
* [Notification Center Detachment](#notification-center-detachment)
* [Opening Brace Spacing](#opening-brace-spacing)
* [Operator Usage Whitespace](#operator-usage-whitespace)
* [Operator Function Whitespace](#operator-function-whitespace)
* [Private over fileprivate](#private-over-fileprivate)
* [Private Unit Test](#private-unit-test)
* [Protocol Property Accessors Order](#protocol-property-accessors-order)
* [Quick Discouraged Call](#quick-discouraged-call)
* [Redundant Discardable Let](#redundant-discardable-let)
* [Redundant Optional Initialization](#redundant-optional-initialization)
* [Redundant Set Access Control Rule](#redundant-set-access-control-rule)
* [Redundant String Enum Value](#redundant-string-enum-value)
* [Redundant Void Return](#redundant-void-return)
* [Returning Whitespace](#returning-whitespace)
* [Shorthand Operator](#shorthand-operator)
* [Statement Position](#statement-position)
* [Strict fileprivate](#strict-fileprivate)
* [Superfluous Disable Command](#superfluous-disable-command)
* [Switch and Case Statement Alignment](#switch-and-case-statement-alignment)
* [Syntactic Sugar](#syntactic-sugar)
* [Todo](#todo)
* [Trailing Comma](#trailing-comma)
* [Trailing Newline](#trailing-newline)
* [Trailing Semicolon](#trailing-semicolon)
* [Trailing Whitespace](#trailing-whitespace)
* [Type Body Length](#type-body-length)
* [Type Name](#type-name)
* [Unneeded Break in Switch](#unneeded-break-in-switch)
* [Unused Closure Parameter](#unused-closure-parameter)
* [Unused Enumerated](#unused-enumerated)
* [Unused Optional Binding](#unused-optional-binding)
* [Valid IBInspectable](#valid-ibinspectable)
* [Vertical Parameter Alignment](#vertical-parameter-alignment)
* [Vertical Whitespace](#vertical-whitespace)
* [Void Return](#void-return)
* [Weak Delegate](#weak-delegate)
* [XCTFail Message](#xctfail-message)

--------


## Block Based KVO

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`block_based_kvo` | Enabled | No | idiomatic | No | 3.0.0 

Prefer the new block based KVO API with keypaths when using Swift 3.2 or later.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let observer = foo.observe(\.value, options: [.new]) { (foo, change) in
   print(change.newValue)
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class Foo: NSObject {
   override ↓func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {}
}
```

```swift
class Foo: NSObject {
   override ↓func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: Dictionary<NSKeyValueChangeKey, Any>?,
                               context: UnsafeMutableRawPointer?) {}
}
```

</details>



## Class Delegate Protocol

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`class_delegate_protocol` | Enabled | No | lint | No | 3.0.0 

Delegate protocols should be class-only so they can be weakly referenced.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
protocol FooDelegate: class {}

```

```swift
protocol FooDelegate: class, BarDelegate {}

```

```swift
protocol Foo {}

```

```swift
class FooDelegate {}

```

```swift
@objc protocol FooDelegate {}

```

```swift
@objc(MyFooDelegate)
 protocol FooDelegate {}

```

```swift
protocol FooDelegate: BarDelegate {}

```

```swift
protocol FooDelegate: AnyObject {}

```

```swift
protocol FooDelegate: NSObjectProtocol {}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓protocol FooDelegate {}

```

```swift
↓protocol FooDelegate: Bar {}

```

</details>



## Closing Brace Spacing

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`closing_brace` | Enabled | Yes | style | No | 3.0.0 

Closing brace with closing parenthesis should not have any whitespaces in the middle.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
[].map({ })
```

```swift
[].map(
  { }
)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
[].map({ ↓} )
```

```swift
[].map({ ↓}	)
```

</details>



## Closure Parameter Position

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`closure_parameter_position` | Enabled | No | style | No | 3.0.0 

Closure parameters should be on the same line as opening brace.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
[1, 2].map { $0 + 1 }

```

```swift
[1, 2].map({ $0 + 1 })

```

```swift
[1, 2].map { number in
 number + 1 
}

```

```swift
[1, 2].map { number -> Int in
 number + 1 
}

```

```swift
[1, 2].map { (number: Int) -> Int in
 number + 1 
}

```

```swift
[1, 2].map { [weak self] number in
 number + 1 
}

```

```swift
[1, 2].something(closure: { number in
 number + 1 
})

```

```swift
let isEmpty = [1, 2].isEmpty()

```

```swift
rlmConfiguration.migrationBlock.map { rlmMigration in
return { migration, schemaVersion in
rlmMigration(migration.rlmMigration, schemaVersion)
}
}
```

```swift
let mediaView: UIView = { [weak self] index in
   return UIView()
}(index)

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
[1, 2].map {
 ↓number in
 number + 1 
}

```

```swift
[1, 2].map {
 ↓number -> Int in
 number + 1 
}

```

```swift
[1, 2].map {
 (↓number: Int) -> Int in
 number + 1 
}

```

```swift
[1, 2].map {
 [weak self] ↓number in
 number + 1 
}

```

```swift
[1, 2].map { [weak self]
 ↓number in
 number + 1 
}

```

```swift
[1, 2].map({
 ↓number in
 number + 1 
})

```

```swift
[1, 2].something(closure: {
 ↓number in
 number + 1 
})

```

```swift
[1, 2].reduce(0) {
 ↓sum, ↓number in
 number + sum 
}

```

</details>



## Closure Spacing

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`closure_spacing` | Disabled | Yes | style | No | 3.0.0 

Closure expressions should have a single space inside each brace.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
[].map ({ $0.description })
```

```swift
[].filter { $0.contains(location) }
```

```swift
extension UITableViewCell: ReusableView { }
```

```swift
extension UITableViewCell: ReusableView {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
[].filter(↓{$0.contains(location)})
```

```swift
[].map(↓{$0})
```

```swift
(↓{each in return result.contains(where: ↓{e in return e}) }).count
```

```swift
filter ↓{ sorted ↓{ $0 < $1}}
```

</details>



## Colon

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`colon` | Enabled | Yes | style | No | 3.0.0 

Colons should be next to the identifier when specifying a type and next to the key in dictionary literals.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let abc: Void

```

```swift
let abc: [Void: Void]

```

```swift
let abc: (Void, Void)

```

```swift
let abc: ([Void], String, Int)

```

```swift
let abc: [([Void], String, Int)]

```

```swift
let abc: String="def"

```

```swift
let abc: Int=0

```

```swift
let abc: Enum=Enum.Value

```

```swift
func abc(def: Void) {}

```

```swift
func abc(def: Void, ghi: Void) {}

```

```swift
// 周斌佳年周斌佳
let abc: String = "abc:"
```

```swift
let abc = [Void: Void]()

```

```swift
let abc = [1: [3: 2], 3: 4]

```

```swift
let abc = ["string": "string"]

```

```swift
let abc = ["string:string": "string"]

```

```swift
let abc: [String: Int]

```

```swift
func foo(bar: [String: Int]) {}

```

```swift
func foo() -> [String: Int] { return [:] }

```

```swift
let abc: Any

```

```swift
let abc: [Any: Int]

```

```swift
let abc: [String: Any]

```

```swift
class Foo: Bar {}

```

```swift
class Foo<T: Equatable> {}

```

```swift
switch foo {
case .bar:
    _ = something()
}

```

```swift
object.method(x: 5, y: "string")

```

```swift
object.method(x: 5, y:
              "string")
```

```swift
object.method(5, y: "string")

```

```swift
func abc() { def(ghi: jkl) }
```

```swift
func abc(def: Void) { ghi(jkl: mno) }
```

```swift
class ABC { let def = ghi(jkl: mno) } }
```

```swift
func foo() { let dict = [1: 1] }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let ↓abc:Void

```

```swift
let ↓abc:  Void

```

```swift
let ↓abc :Void

```

```swift
let ↓abc : Void

```

```swift
let ↓abc : [Void: Void]

```

```swift
let ↓abc : (Void, String, Int)

```

```swift
let ↓abc : ([Void], String, Int)

```

```swift
let ↓abc : [([Void], String, Int)]

```

```swift
let ↓abc:  (Void, String, Int)

```

```swift
let ↓abc:  ([Void], String, Int)

```

```swift
let ↓abc:  [([Void], String, Int)]

```

```swift
let ↓abc :String="def"

```

```swift
let ↓abc :Int=0

```

```swift
let ↓abc :Int = 0

```

```swift
let ↓abc:Int=0

```

```swift
let ↓abc:Int = 0

```

```swift
let ↓abc:Enum=Enum.Value

```

```swift
func abc(↓def:Void) {}

```

```swift
func abc(↓def:  Void) {}

```

```swift
func abc(↓def :Void) {}

```

```swift
func abc(↓def : Void) {}

```

```swift
func abc(def: Void, ↓ghi :Void) {}

```

```swift
let abc = [Void↓:Void]()

```

```swift
let abc = [Void↓ : Void]()

```

```swift
let abc = [Void↓:  Void]()

```

```swift
let abc = [Void↓ :  Void]()

```

```swift
let abc = [1: [3↓ : 2], 3: 4]

```

```swift
let abc = [1: [3↓ : 2], 3↓:  4]

```

```swift
let abc: [↓String : Int]

```

```swift
let abc: [↓String:Int]

```

```swift
func foo(bar: [↓String : Int]) {}

```

```swift
func foo(bar: [↓String:Int]) {}

```

```swift
func foo() -> [↓String : Int] { return [:] }

```

```swift
func foo() -> [↓String:Int] { return [:] }

```

```swift
let ↓abc : Any

```

```swift
let abc: [↓Any : Int]

```

```swift
let abc: [↓String : Any]

```

```swift
class ↓Foo : Bar {}

```

```swift
class ↓Foo:Bar {}

```

```swift
class Foo<↓T:Equatable> {}

```

```swift
class Foo<↓T : Equatable> {}

```

```swift
object.method(x: 5, y↓ : "string")

```

```swift
object.method(x↓:5, y: "string")

```

```swift
object.method(x↓:  5, y: "string")

```

```swift
func abc() { def(ghi↓:jkl) }
```

```swift
func abc(def: Void) { ghi(jkl↓:mno) }
```

```swift
class ABC { let def = ghi(jkl↓:mno) } }
```

```swift
func foo() { let dict = [1↓ : 1] }
```

</details>



## Comma Spacing

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`comma` | Enabled | Yes | style | No | 3.0.0 

There should be no space before and one after any comma.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func abc(a: String, b: String) { }
```

```swift
abc(a: "string", b: "string"
```

```swift
enum a { case a, b, c }
```

```swift
func abc(
  a: String,  // comment
  bcd: String // comment
) {
}

```

```swift
func abc(
  a: String,
  bcd: String
) {
}

```

```swift
#imageLiteral(resourceName: "foo,bar,baz")
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func abc(a: String↓ ,b: String) { }
```

```swift
func abc(a: String↓ ,b: String↓ ,c: String↓ ,d: String) { }
```

```swift
abc(a: "string"↓,b: "string"
```

```swift
enum a { case a↓ ,b }
```

```swift
let result = plus(
    first: 3↓ , // #683
    second: 4
)

```

</details>



## Compiler Protocol Init

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`compiler_protocol_init` | Enabled | No | lint | No | 3.0.0 

The initializers declared in compiler protocols such as `ExpressibleByArrayLiteral` shouldn't be called directly.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let set: Set<Int> = [1, 2]

```

```swift
let set = Set(array)

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let set = ↓Set(arrayLiteral: 1, 2)

```

```swift
let set = ↓Set.init(arrayLiteral: 1, 2)

```

</details>



## Control Statement

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`control_statement` | Enabled | No | style | No | 3.0.0 

`if`, `for`, `guard`, `switch`, `while`, and `catch` statements shouldn't unnecessarily wrap their conditionals or arguments in parentheses.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
if condition {

```

```swift
if (a, b) == (0, 1) {

```

```swift
if (a || b) && (c || d) {

```

```swift
if (min...max).contains(value) {

```

```swift
if renderGif(data) {

```

```swift
renderGif(data)

```

```swift
for item in collection {

```

```swift
for (key, value) in dictionary {

```

```swift
for (index, value) in enumerate(array) {

```

```swift
for var index = 0; index < 42; index++ {

```

```swift
guard condition else {

```

```swift
while condition {

```

```swift
} while condition {

```

```swift
do { ; } while condition {

```

```swift
switch foo {

```

```swift
do {
} catch let error as NSError {
}
```

```swift
foo().catch(all: true) {}
```

```swift
if max(a, b) < c {

```

```swift
switch (lhs, rhs) {

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓if (condition) {

```

```swift
↓if(condition) {

```

```swift
↓if (condition == endIndex) {

```

```swift
↓if ((a || b) && (c || d)) {

```

```swift
↓if ((min...max).contains(value)) {

```

```swift
↓for (item in collection) {

```

```swift
↓for (var index = 0; index < 42; index++) {

```

```swift
↓for(item in collection) {

```

```swift
↓for(var index = 0; index < 42; index++) {

```

```swift
↓guard (condition) else {

```

```swift
↓while (condition) {

```

```swift
↓while(condition) {

```

```swift
} ↓while (condition) {

```

```swift
} ↓while(condition) {

```

```swift
do { ; } ↓while(condition) {

```

```swift
do { ; } ↓while (condition) {

```

```swift
↓switch (foo) {

```

```swift
do {
} ↓catch(let error as NSError) {
}
```

```swift
↓if (max(a, b) < c) {

```

</details>




## Custom Rules

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`custom_rules` | Enabled | No | style | No | 3.0.0 

Create custom rules by providing a regex string. Optionally specify what syntax kinds to match against, the severity level, and what message to display.



## Cyclomatic Complexity

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`cyclomatic_complexity` | Enabled | No | metrics | No | 3.0.0 

Complexity of function bodies should be limited.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func f1() {
if true {
for _ in 1..5 { } }
if false { }
}
```

```swift
func f(code: Int) -> Int {switch code {
 case 0: fallthrough
case 0: return 1
case 0: return 1
case 0: return 1
case 0: return 1
case 0: return 1
case 0: return 1
case 0: return 1
case 0: return 1
default: return 1}}
```

```swift
func f1() {if true {}; if true {}; if true {}; if true {}; if true {}; if true {}
func f2() {
if true {}; if true {}; if true {}; if true {}; if true {}
}}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓func f1() {
  if true {
    if true {
      if false {}
    }
  }
  if false {}
  let i = 0

  switch i {
  case 1: break
  case 2: break
  case 3: break
  case 4: break
 default: break
  }
  for _ in 1...5 {
    guard true else {
      return
    }
  }
}

```

</details>



## Discarded Notification Center Observer

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`discarded_notification_center_observer` | Enabled | No | lint | No | 3.0.0 

When registering for a notification using a block, the opaque observer that is returned should be stored so it can be removed later.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let foo = nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }

```

```swift
let foo = nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })

```

```swift
func foo() -> Any {
   return nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil) { }

```

```swift
↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })

```

```swift
@discardableResult func foo() -> Any {
   return ↓nc.addObserver(forName: .NSSystemTimeZoneDidChange, object: nil, queue: nil, using: { })
}

```

</details>



## Discouraged Direct Initialization

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`discouraged_direct_init` | Enabled | No | lint | No | 3.0.0 

Discouraged direct initialization of types that can be harmful.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let foo = UIDevice.current
```

```swift
let foo = Bundle.main
```

```swift
let foo = Bundle(path: "bar")
```

```swift
let foo = Bundle(identifier: "bar")
```

```swift
let foo = Bundle.init(path: "bar")
```

```swift
let foo = Bundle.init(identifier: "bar")
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓UIDevice()
```

```swift
↓Bundle()
```

```swift
let foo = ↓UIDevice()
```

```swift
let foo = ↓Bundle()
```

```swift
let foo = bar(bundle: ↓Bundle(), device: ↓UIDevice())
```

```swift
↓UIDevice.init()
```

```swift
↓Bundle.init()
```

```swift
let foo = ↓UIDevice.init()
```

```swift
let foo = ↓Bundle.init()
```

```swift
let foo = bar(bundle: ↓Bundle.init(), device: ↓UIDevice.init())
```

</details>



## Dynamic Inline

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`dynamic_inline` | Enabled | No | lint | No | 3.0.0 

Avoid using 'dynamic' and '@inline(__always)' together.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class C {
dynamic func f() {}}
```

```swift
class C {
@inline(__always) func f() {}}
```

```swift
class C {
@inline(never) dynamic func f() {}}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class C {
@inline(__always) dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always) public dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always) dynamic internal ↓func f() {}
}
```

```swift
class C {
@inline(__always)
dynamic ↓func f() {}
}
```

```swift
class C {
@inline(__always)
dynamic
↓func f() {}
}
```

</details>



## Empty Enum Arguments

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`empty_enum_arguments` | Enabled | Yes | style | No | 3.0.0 

Arguments can be omitted when matching enums with associated types if they are not used.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
switch foo {
    case .bar: break
}
```

```swift
switch foo {
    case .bar(let x): break
}
```

```swift
switch foo {
    case let .bar(x): break
}
```

```swift
switch (foo, bar) {
    case (_, _): break
}
```

```swift
switch foo {
    case "bar".uppercased(): break
}
```

```swift
switch (foo, bar) {
    case (_, _) where !something: break
}
```

```swift
switch foo {
    case (let f as () -> String)?: break
}
```

```swift
switch foo {
    default: break
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
switch foo {
    case .bar↓(_): break
}
```

```swift
switch foo {
    case .bar↓(): break
}
```

```swift
switch foo {
    case .bar↓(_), .bar2↓(_): break
}
```

```swift
switch foo {
    case .bar↓() where method() > 2: break
}
```

```swift
func example(foo: Foo) {
    switch foo {
    case case .bar↓(_):
        break
    }
}
```

</details>



## Empty Parameters

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`empty_parameters` | Enabled | Yes | style | No | 3.0.0 

Prefer `() -> ` over `Void -> `.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let abc: () -> Void = {}

```

```swift
func foo(completion: () -> Void)

```

```swift
func foo(completion: () thows -> Void)

```

```swift
let foo: (ConfigurationTests) -> Void throws -> Void)

```

```swift
let foo: (ConfigurationTests) ->   Void throws -> Void)

```

```swift
let foo: (ConfigurationTests) ->Void throws -> Void)

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let abc: ↓(Void) -> Void = {}

```

```swift
func foo(completion: ↓(Void) -> Void)

```

```swift
func foo(completion: ↓(Void) throws -> Void)

```

```swift
let foo: ↓(Void) -> () throws -> Void)

```

</details>



## Empty Parentheses with Trailing Closure

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`empty_parentheses_with_trailing_closure` | Enabled | Yes | style | No | 3.0.0 

When using trailing closures, empty parentheses should be avoided after the method call.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
[1, 2].map { $0 + 1 }

```

```swift
[1, 2].map({ $0 + 1 })

```

```swift
[1, 2].reduce(0) { $0 + $1 }
```

```swift
[1, 2].map { number in
 number + 1 
}

```

```swift
let isEmpty = [1, 2].isEmpty()

```

```swift
UIView.animateWithDuration(0.3, animations: {
   self.disableInteractionRightView.alpha = 0
}, completion: { _ in
   ()
})
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
[1, 2].map↓() { $0 + 1 }

```

```swift
[1, 2].map↓( ) { $0 + 1 }

```

```swift
[1, 2].map↓() { number in
 number + 1 
}

```

```swift
[1, 2].map↓(  ) { number in
 number + 1 
}

```

```swift
func foo() -> [Int] {
    return [1, 2].map↓() { $0 + 1 }
}

```

</details>



## Fatal Error Message

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`fatal_error_message` | Disabled | No | idiomatic | No | 3.0.0 

A fatalError call should have a message.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func foo() {
  fatalError("Foo")
}

```

```swift
func foo() {
  fatalError(x)
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func foo() {
  ↓fatalError("")
}

```

```swift
func foo() {
  ↓fatalError()
}

```

</details>



## File Line Length

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`file_length` | Enabled | No | metrics | No | 3.0.0 

Files should not span too many lines.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")

```

```swift
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
print("swiftlint")
//

```

</details>



## For Where

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`for_where` | Enabled | No | idiomatic | No | 3.0.0 

`where` clauses are preferred over a single `if` inside a `for`.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
for user in users where user.id == 1 { }

```

```swift
for user in users {
   if let id = user.id { }
}

```

```swift
for user in users {
   if var id = user.id { }
}

```

```swift
for user in users {
   if user.id == 1 { } else { }
}

```

```swift
for user in users {
   if user.id == 1 {
} else if user.id == 2 { }
}

```

```swift
for user in users {
   if user.id == 1 { }
   print(user)
}

```

```swift
for user in users {
   let id = user.id
   if id == 1 { }
}

```

```swift
for user in users {
   if user.id == 1 { }
   return true
}

```

```swift
for user in users {
   if user.id == 1 && user.age > 18 { }
}

```

```swift
for (index, value) in array.enumerated() {
   if case .valueB(_) = value {
       return index
   }
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
for user in users {
   ↓if user.id == 1 { return true }
}

```

</details>



## Force Cast

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`force_cast` | Enabled | No | idiomatic | No | 3.0.0 

Force casts should be avoided.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
NSNumber() as? Int

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
NSNumber() ↓as! Int

```

</details>



## Force Try

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`force_try` | Enabled | No | idiomatic | No | 3.0.0 

Force tries should be avoided.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func a() throws {}; do { try a() } catch {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func a() throws {}; ↓try! a()
```

</details>



## Force Unwrapping

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`force_unwrapping` | Disabled | No | idiomatic | No | 3.0.0 

Force unwrapping should be avoided.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
if let url = NSURL(string: query)
```

```swift
navigationController?.pushViewController(viewController, animated: true)
```

```swift
let s as! Test
```

```swift
try! canThrowErrors()
```

```swift
let object: Any!
```

```swift
@IBOutlet var constraints: [NSLayoutConstraint]!
```

```swift
setEditing(!editing, animated: true)
```

```swift
navigationController.setNavigationBarHidden(!navigationController.navigationBarHidden, animated: true)
```

```swift
if addedToPlaylist && (!self.selectedFilters.isEmpty || self.searchBar?.text?.isEmpty == false) {}
```

```swift
print("\(xVar)!")
```

```swift
var test = (!bar)
```

```swift
var a: [Int]!
```

```swift
private var myProperty: (Void -> Void)!
```

```swift
func foo(_ options: [AnyHashable: Any]!) {
```

```swift
func foo() -> [Int]!
```

```swift
func foo() -> [AnyHashable: Any]!
```

```swift
func foo() -> [Int]! { return [] }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let url = NSURL(string: query)↓!
```

```swift
navigationController↓!.pushViewController(viewController, animated: true)
```

```swift
let unwrapped = optional↓!
```

```swift
return cell↓!
```

```swift
let url = NSURL(string: "http://www.google.com")↓!
```

```swift
let dict = ["Boooo": "👻"]func bla() -> String { return dict["Boooo"]↓! }
```

```swift
let dict = ["Boooo": "👻"]func bla() -> String { return dict["Boooo"]↓!.contains("B") }
```

```swift
let a = dict["abc"]↓!.contains("B")
```

```swift
dict["abc"]↓!.bar("B")
```

```swift
if dict["a"]↓!!!! {
```

```swift
var foo: [Bool]! = dict["abc"]↓!
```

```swift
context("abc") {
  var foo: [Bool]! = dict["abc"]↓!
}
```

```swift
open var computed: String { return foo.bar↓! }
```

</details>



## Function Body Length

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`function_body_length` | Enabled | No | metrics | No | 3.0.0 

Functions bodies should not span too many lines.



## Function Parameter Count

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`function_parameter_count` | Enabled | No | metrics | No | 3.0.0 

Number of function parameters should be low.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init (a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
`init`(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?<T>(a: T, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
init?<T: String>(a: T, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
func f2(p1: Int, p2: Int) { }
```

```swift
func f(a: Int, b: Int, c: Int, d: Int, x: Int = 42) {}
```

```swift
func f(a: [Int], b: Int, c: Int, d: Int, f: Int) -> [Int] {
let s = a.flatMap { $0 as? [String: Int] } ?? []}}
```

```swift
override func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
↓func initialValue(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
```

```swift
↓func f(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int = 2, g: Int) {}
```

```swift
struct Foo {
init(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}
↓func bar(a: Int, b: Int, c: Int, d: Int, e: Int, f: Int) {}}
```

</details>



## Generic Type Name

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`generic_type_name` | Enabled | No | idiomatic | No | 3.0.0 

Generic type name should only contain alphanumeric characters, start with an uppercase character and span between 1 and 20 characters in length.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func foo<T>() {}

```

```swift
func foo<T>() -> T {}

```

```swift
func foo<T, U>(param: U) -> T {}

```

```swift
func foo<T: Hashable, U: Rule>(param: U) -> T {}

```

```swift
struct Foo<T> {}

```

```swift
class Foo<T> {}

```

```swift
enum Foo<T> {}

```

```swift
func run(_ options: NoOptions<CommandantError<()>>) {}

```

```swift
func foo(_ options: Set<type>) {}

```

```swift
func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool

```

```swift
func configureWith(data: Either<MessageThread, (project: Project, backing: Backing)>)

```

```swift
typealias StringDictionary<T> = Dictionary<String, T>

```

```swift
typealias BackwardTriple<T1, T2, T3> = (T3, T2, T1)

```

```swift
typealias DictionaryOfStrings<T : Hashable> = Dictionary<T, String>

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func foo<↓T_Foo>() {}

```

```swift
func foo<T, ↓U_Foo>(param: U_Foo) -> T {}

```

```swift
func foo<↓TTTTTTTTTTTTTTTTTTTTT>() {}

```

```swift
func foo<↓type>() {}

```

```swift
typealias StringDictionary<↓T_Foo> = Dictionary<String, T_Foo>

```

```swift
typealias BackwardTriple<T1, ↓T2_Bar, T3> = (T3, T2_Bar, T1)

```

```swift
typealias DictionaryOfStrings<↓T_Foo: Hashable> = Dictionary<T_Foo, String>

```

```swift
class Foo<↓T_Foo> {}

```

```swift
class Foo<T, ↓U_Foo> {}

```

```swift
class Foo<↓T_Foo, ↓U_Foo> {}

```

```swift
class Foo<↓TTTTTTTTTTTTTTTTTTTTT> {}

```

```swift
class Foo<↓type> {}

```

```swift
struct Foo<↓T_Foo> {}

```

```swift
struct Foo<T, ↓U_Foo> {}

```

```swift
struct Foo<↓T_Foo, ↓U_Foo> {}

```

```swift
struct Foo<↓TTTTTTTTTTTTTTTTTTTTT> {}

```

```swift
struct Foo<↓type> {}

```

```swift
enum Foo<↓T_Foo> {}

```

```swift
enum Foo<T, ↓U_Foo> {}

```

```swift
enum Foo<↓T_Foo, ↓U_Foo> {}

```

```swift
enum Foo<↓TTTTTTTTTTTTTTTTTTTTT> {}

```

```swift
enum Foo<↓type> {}

```

</details>




## Identifier Name

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`identifier_name` | Enabled | No | style | No | 3.0.0 

Identifier names should only contain alphanumeric characters and start with a lowercase character or should only contain capital letters. In an exception to the above, variable names may start with a capital letter when they are declared static and immutable. Variable names should not be too long or too short.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let myLet = 0
```

```swift
var myVar = 0
```

```swift
private let _myLet = 0
```

```swift
class Abc { static let MyLet = 0 }
```

```swift
let URL: NSURL? = nil
```

```swift
let XMLString: String? = nil
```

```swift
override var i = 0
```

```swift
enum Foo { case myEnum }
```

```swift
func isOperator(name: String) -> Bool
```

```swift
func typeForKind(_ kind: SwiftDeclarationKind) -> String
```

```swift
func == (lhs: SyntaxToken, rhs: SyntaxToken) -> Bool
```

```swift
override func IsOperator(name: String) -> Bool
```

```swift
enum Foo { case `private` }
```

```swift
enum Foo { case value(String) }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓let MyLet = 0
```

```swift
↓let _myLet = 0
```

```swift
private ↓let myLet_ = 0
```

```swift
↓let myExtremelyVeryVeryVeryVeryVeryVeryLongLet = 0
```

```swift
↓var myExtremelyVeryVeryVeryVeryVeryVeryLongVar = 0
```

```swift
private ↓let _myExtremelyVeryVeryVeryVeryVeryVeryLongLet = 0
```

```swift
↓let i = 0
```

```swift
↓var id = 0
```

```swift
private ↓let _i = 0
```

```swift
↓func IsOperator(name: String) -> Bool
```

```swift
enum Foo { case ↓MyEnum }
```

</details>



## Implicit Getter

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`implicit_getter` | Enabled | No | style | No | 3.0.0 

Computed read-only properties and subscripts should avoid using the get keyword.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Foo {
    var foo: Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
class Foo {
    var foo: Int {
        return 20
    }
}
```

```swift
class Foo {
    static var foo: Int {
        return 20
    }
}
```

```swift
class Foo {
    static var foo: Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
class Foo {
    var foo: Int
}
```

```swift
class Foo {
    var foo: Int {
        return getValueFromDisk()
    }
}
```

```swift
class Foo {
    var foo: String {
        return "get"
    }
}
```

```swift
protocol Foo {
    var foo: Int { get }

```

```swift
protocol Foo {
    var foo: Int { get set }

```

```swift
class Foo {
    var foo: Int {
        struct Bar {
            var bar: Int {
                get { return 1 }
                set { _ = newValue }
            }
        }

        return Bar().bar
    }
}
```

```swift
var _objCTaggedPointerBits: UInt {
    @inline(__always) get { return 0 }
}
```

```swift
var next: Int? {
    mutating get {
        defer { self.count += 1 }
        return self.count
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        return 20
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        get { return 3 }
        set { _abc = newValue }
    }
}
```

```swift
protocol Foo {
    subscript(i: Int) -> Int { get }
}
```

```swift
protocol Foo {
    subscript(i: Int) -> Int { get set }
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class Foo {
    var foo: Int {
        ↓get {
            return 20
        }
    }
}
```

```swift
class Foo {
    var foo: Int {
        ↓get{ return 20 }
    }
}
```

```swift
class Foo {
    static var foo: Int {
        ↓get {
            return 20
        }
    }
}
```

```swift
var foo: Int {
    ↓get { return 20 }
}
```

```swift
class Foo {
    @objc func bar() {}
    var foo: Int {
        ↓get {
            return 20
        }
    }
}
```

```swift
class Foo {
    subscript(i: Int) -> Int {
        ↓get {
            return 20
        }
    }
}
```

</details>



## Implicitly Unwrapped Optional

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`implicitly_unwrapped_optional` | Disabled | No | idiomatic | No | 3.0.0 

Implicitly unwrapped optionals should be avoided when possible.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
@IBOutlet private var label: UILabel!
```

```swift
@IBOutlet var label: UILabel!
```

```swift
@IBOutlet var label: [UILabel!]
```

```swift
if !boolean {}
```

```swift
let int: Int? = 42
```

```swift
let int: Int? = nil
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let label: UILabel!
```

```swift
let IBOutlet: UILabel!
```

```swift
let labels: [UILabel!]
```

```swift
var ints: [Int!] = [42, nil, 42]
```

```swift
let label: IBOutlet!
```

```swift
let int: Int! = 42
```

```swift
let int: Int! = nil
```

```swift
var int: Int! = 42
```

```swift
let int: ImplicitlyUnwrappedOptional<Int>
```

```swift
let collection: AnyCollection<Int!>
```

```swift
func foo(int: Int!) {}
```

</details>



## Inert Defer

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`inert_defer` | Enabled | No | lint | No | 3.0.0 

If defer is at the end of its parent scope, it will be executed right where it is anyway.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func example3() {
    defer { /* deferred code */ }

    print("other code")
}
```

```swift
func example4() {
    if condition {
        defer { /* deferred code */ }
        print("other code")
    }
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func example0() {
    ↓defer { /* deferred code */ }
}
```

```swift
func example1() {
    ↓defer { /* deferred code */ }
    // comment
}
```

```swift
func example2() {
    if condition {
        ↓defer { /* deferred code */ }
        // comment
    }
}
```

</details>



## Is Disjoint

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`is_disjoint` | Enabled | No | idiomatic | No | 3.0.0 

Prefer using `Set.isDisjoint(with:)` over `Set.intersection(_:).isEmpty`.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
_ = Set(syntaxKinds).isDisjoint(with: commentAndStringKindsSet)
```

```swift
let isObjc = !objcAttributes.isDisjoint(with: dictionary.enclosedSwiftAttributes)
```

```swift
_ = Set(syntaxKinds).intersection(commentAndStringKindsSet)
```

```swift
_ = !objcAttributes.intersection(dictionary.enclosedSwiftAttributes)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
_ = Set(syntaxKinds).↓intersection(commentAndStringKindsSet).isEmpty
```

```swift
let isObjc = !objcAttributes.↓intersection(dictionary.enclosedSwiftAttributes).isEmpty
```

</details>



## Large Tuple

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`large_tuple` | Enabled | No | metrics | No | 3.0.0 

Tuples shouldn't have too many members. Create a custom type instead.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let foo: (Int, Int)

```

```swift
let foo: (start: Int, end: Int)

```

```swift
let foo: (Int, (Int, String))

```

```swift
func foo() -> (Int, Int)

```

```swift
func foo() -> (Int, Int) {}

```

```swift
func foo(bar: String) -> (Int, Int)

```

```swift
func foo(bar: String) -> (Int, Int) {}

```

```swift
func foo() throws -> (Int, Int)

```

```swift
func foo() throws -> (Int, Int) {}

```

```swift
let foo: (Int, Int, Int) -> Void

```

```swift
let foo: (Int, Int, Int) throws -> Void

```

```swift
func foo(bar: (Int, String, Float) -> Void)

```

```swift
func foo(bar: (Int, String, Float) throws -> Void)

```

```swift
var completionHandler: ((_ data: Data?, _ resp: URLResponse?, _ e: NSError?) -> Void)!

```

```swift
func getDictionaryAndInt() -> (Dictionary<Int, String>, Int)?

```

```swift
func getGenericTypeAndInt() -> (Type<Int, String, Float>, Int)?

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓let foo: (Int, Int, Int)

```

```swift
↓let foo: (start: Int, end: Int, value: String)

```

```swift
↓let foo: (Int, (Int, Int, Int))

```

```swift
func foo(↓bar: (Int, Int, Int))

```

```swift
func foo() -> ↓(Int, Int, Int)

```

```swift
func foo() -> ↓(Int, Int, Int) {}

```

```swift
func foo(bar: String) -> ↓(Int, Int, Int)

```

```swift
func foo(bar: String) -> ↓(Int, Int, Int) {}

```

```swift
func foo() throws -> ↓(Int, Int, Int)

```

```swift
func foo() throws -> ↓(Int, Int, Int) {}

```

```swift
func foo() throws -> ↓(Int, ↓(String, String, String), Int) {}

```

```swift
func getDictionaryAndInt() -> (Dictionary<Int, ↓(String, String, String)>, Int)?

```

</details>



## Leading Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`leading_whitespace` | Enabled | Yes | style | No | 3.0.0 

Files should not contain leading whitespace.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
//

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift


```

```swift
 //

```

</details>



## Legacy CGGeometry Functions

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`legacy_cggeometry_functions` | Enabled | Yes | idiomatic | No | 3.0.0 

Struct extension properties and methods are preferred over legacy functions

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
rect.width
```

```swift
rect.height
```

```swift
rect.minX
```

```swift
rect.midX
```

```swift
rect.maxX
```

```swift
rect.minY
```

```swift
rect.midY
```

```swift
rect.maxY
```

```swift
rect.isNull
```

```swift
rect.isEmpty
```

```swift
rect.isInfinite
```

```swift
rect.standardized
```

```swift
rect.integral
```

```swift
rect.insetBy(dx: 5.0, dy: -7.0)
```

```swift
rect.offsetBy(dx: 5.0, dy: -7.0)
```

```swift
rect1.union(rect2)
```

```swift
rect1.intersect(rect2)
```

```swift
rect1.contains(rect2)
```

```swift
rect.contains(point)
```

```swift
rect1.intersects(rect2)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓CGRectGetWidth(rect)
```

```swift
↓CGRectGetHeight(rect)
```

```swift
↓CGRectGetMinX(rect)
```

```swift
↓CGRectGetMidX(rect)
```

```swift
↓CGRectGetMaxX(rect)
```

```swift
↓CGRectGetMinY(rect)
```

```swift
↓CGRectGetMidY(rect)
```

```swift
↓CGRectGetMaxY(rect)
```

```swift
↓CGRectIsNull(rect)
```

```swift
↓CGRectIsEmpty(rect)
```

```swift
↓CGRectIsInfinite(rect)
```

```swift
↓CGRectStandardize(rect)
```

```swift
↓CGRectIntegral(rect)
```

```swift
↓CGRectInset(rect, 10, 5)
```

```swift
↓CGRectOffset(rect, -2, 8.3)
```

```swift
↓CGRectUnion(rect1, rect2)
```

```swift
↓CGRectIntersection(rect1, rect2)
```

```swift
↓CGRectContainsRect(rect1, rect2)
```

```swift
↓CGRectContainsPoint(rect, point)
```

```swift
↓CGRectIntersectsRect(rect1, rect2)
```

</details>



## Legacy Constant

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`legacy_constant` | Enabled | Yes | idiomatic | No | 3.0.0 

Struct-scoped constants are preferred over legacy global constants.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
CGRect.infinite
```

```swift
CGPoint.zero
```

```swift
CGRect.zero
```

```swift
CGSize.zero
```

```swift
NSPoint.zero
```

```swift
NSRect.zero
```

```swift
NSSize.zero
```

```swift
CGRect.null
```

```swift
CGFloat.pi
```

```swift
Float.pi
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓CGRectInfinite
```

```swift
↓CGPointZero
```

```swift
↓CGRectZero
```

```swift
↓CGSizeZero
```

```swift
↓NSZeroPoint
```

```swift
↓NSZeroRect
```

```swift
↓NSZeroSize
```

```swift
↓CGRectNull
```

```swift
↓CGFloat(M_PI)
```

```swift
↓Float(M_PI)
```

</details>



## Legacy Constructor

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`legacy_constructor` | Enabled | Yes | idiomatic | No | 3.0.0 

Swift constructors are preferred over legacy convenience functions.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
CGPoint(x: 10, y: 10)
```

```swift
CGPoint(x: xValue, y: yValue)
```

```swift
CGSize(width: 10, height: 10)
```

```swift
CGSize(width: aWidth, height: aHeight)
```

```swift
CGRect(x: 0, y: 0, width: 10, height: 10)
```

```swift
CGRect(x: xVal, y: yVal, width: aWidth, height: aHeight)
```

```swift
CGVector(dx: 10, dy: 10)
```

```swift
CGVector(dx: deltaX, dy: deltaY)
```

```swift
NSPoint(x: 10, y: 10)
```

```swift
NSPoint(x: xValue, y: yValue)
```

```swift
NSSize(width: 10, height: 10)
```

```swift
NSSize(width: aWidth, height: aHeight)
```

```swift
NSRect(x: 0, y: 0, width: 10, height: 10)
```

```swift
NSRect(x: xVal, y: yVal, width: aWidth, height: aHeight)
```

```swift
NSRange(location: 10, length: 1)
```

```swift
NSRange(location: loc, length: len)
```

```swift
UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
```

```swift
UIEdgeInsets(top: aTop, left: aLeft, bottom: aBottom, right: aRight)
```

```swift
NSEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
```

```swift
NSEdgeInsets(top: aTop, left: aLeft, bottom: aBottom, right: aRight)
```

```swift
UIOffset(horizontal: 0, vertical: 10)
```

```swift
UIOffset(horizontal: horizontal, vertical: vertical)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓CGPointMake(10, 10)
```

```swift
↓CGPointMake(xVal, yVal)
```

```swift
↓CGPointMake(calculateX(), 10)

```

```swift
↓CGSizeMake(10, 10)
```

```swift
↓CGSizeMake(aWidth, aHeight)
```

```swift
↓CGRectMake(0, 0, 10, 10)
```

```swift
↓CGRectMake(xVal, yVal, width, height)
```

```swift
↓CGVectorMake(10, 10)
```

```swift
↓CGVectorMake(deltaX, deltaY)
```

```swift
↓NSMakePoint(10, 10)
```

```swift
↓NSMakePoint(xVal, yVal)
```

```swift
↓NSMakeSize(10, 10)
```

```swift
↓NSMakeSize(aWidth, aHeight)
```

```swift
↓NSMakeRect(0, 0, 10, 10)
```

```swift
↓NSMakeRect(xVal, yVal, width, height)
```

```swift
↓NSMakeRange(10, 1)
```

```swift
↓NSMakeRange(loc, len)
```

```swift
↓UIEdgeInsetsMake(0, 0, 10, 10)
```

```swift
↓UIEdgeInsetsMake(top, left, bottom, right)
```

```swift
↓NSEdgeInsetsMake(0, 0, 10, 10)
```

```swift
↓NSEdgeInsetsMake(top, left, bottom, right)
```

```swift
↓CGVectorMake(10, 10)
↓NSMakeRange(10, 1)
```

```swift
↓UIOffsetMake(0, 10)
```

```swift
↓UIOffsetMake(horizontal, vertical)
```

</details>



## Legacy NSGeometry Functions

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`legacy_nsgeometry_functions` | Enabled | Yes | idiomatic | No | 3.0.0 

Struct extension properties and methods are preferred over legacy functions

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
rect.width
```

```swift
rect.height
```

```swift
rect.minX
```

```swift
rect.midX
```

```swift
rect.maxX
```

```swift
rect.minY
```

```swift
rect.midY
```

```swift
rect.maxY
```

```swift
rect.isEmpty
```

```swift
rect.integral
```

```swift
rect.insetBy(dx: 5.0, dy: -7.0)
```

```swift
rect.offsetBy(dx: 5.0, dy: -7.0)
```

```swift
rect1.union(rect2)
```

```swift
rect1.intersect(rect2)
```

```swift
rect1.contains(rect2)
```

```swift
rect.contains(point)
```

```swift
rect1.intersects(rect2)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓NSWidth(rect)
```

```swift
↓NSHeight(rect)
```

```swift
↓NSMinX(rect)
```

```swift
↓NSMidX(rect)
```

```swift
↓NSMaxX(rect)
```

```swift
↓NSMinY(rect)
```

```swift
↓NSMidY(rect)
```

```swift
↓NSMaxY(rect)
```

```swift
↓NSEqualRects(rect1, rect2)
```

```swift
↓NSEqualSizes(size1, size2)
```

```swift
↓NSEqualPoints(point1, point2)
```

```swift
↓NSEdgeInsetsEqual(insets2, insets2)
```

```swift
↓NSIsEmptyRect(rect)
```

```swift
↓NSIntegralRect(rect)
```

```swift
↓NSInsetRect(rect, 10, 5)
```

```swift
↓NSOffsetRect(rect, -2, 8.3)
```

```swift
↓NSUnionRect(rect1, rect2)
```

```swift
↓NSIntersectionRect(rect1, rect2)
```

```swift
↓NSContainsRect(rect1, rect2)
```

```swift
↓NSPointInRect(rect, point)
```

```swift
↓NSIntersectsRect(rect1, rect2)
```

</details>




## Line Length

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`line_length` | Enabled | No | metrics | No | 3.0.0 

Lines should not span too many characters.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

```

```swift
#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

```

```swift
#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

```

```swift
#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

```

```swift
#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")#imageLiteral(resourceName: "image.jpg")

```

</details>



## Mark

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`mark` | Enabled | Yes | lint | No | 3.0.0 

MARK comment should be in valid format. e.g. '// MARK: ...' or '// MARK: - ...'

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
// MARK: good

```

```swift
// MARK: - good

```

```swift
// MARK: -

```

```swift
// BOOKMARK
```

```swift
//BOOKMARK
```

```swift
// BOOKMARKS
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓//MARK: bad
```

```swift
↓// MARK:bad
```

```swift
↓//MARK:bad
```

```swift
↓//  MARK: bad
```

```swift
↓// MARK:  bad
```

```swift
↓// MARK: -bad
```

```swift
↓// MARK:- bad
```

```swift
↓// MARK:-bad
```

```swift
↓//MARK: - bad
```

```swift
↓//MARK:- bad
```

```swift
↓//MARK: -bad
```

```swift
↓//MARK:-bad
```

```swift
↓//Mark: bad
```

```swift
↓// Mark: bad
```

```swift
↓// MARK bad
```

```swift
↓//MARK bad
```

```swift
↓// MARK - bad
```

```swift
↓//MARK : bad
```

```swift
↓// MARKL:
```

```swift
↓// MARKR 
```

```swift
↓// MARKK -
```

```swift
↓//MARK:- Top-Level bad mark
↓//MARK:- Another bad mark
struct MarkTest {}
↓// MARK:- Bad mark
extension MarkTest {}

```

</details>



## Multiple Closures with Trailing Closure

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`multiple_closures_with_trailing_closure` | Enabled | No | style | No | 3.0.0 

Trailing closure syntax should not be used when passing more than one closure argument.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
foo.map { $0 + 1 }

```

```swift
foo.reduce(0) { $0 + $1 }

```

```swift
if let foo = bar.map({ $0 + 1 }) {

}

```

```swift
foo.something(param1: { $0 }, param2: { $0 + 1 })

```

```swift
UIView.animate(withDuration: 1.0) {
    someView.alpha = 0.0
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
foo.something(param1: { $0 }) ↓{ $0 + 1 }
```

```swift
UIView.animate(withDuration: 1.0, animations: {
    someView.alpha = 0.0
}) ↓{ _ in
    someView.removeFromSuperview()
}
```

</details>



## Nesting

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`nesting` | Enabled | No | metrics | No | 3.0.0 

Types should be nested at most 1 level deep, and statements should be nested at most 5 levels deep.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Class0 { class Class1 {} }

```

```swift
func func0() {
func func1() {
func func2() {
func func3() {
func func4() { func func5() {
}
}
}
}
}
}

```

```swift
struct Class0 { struct Class1 {} }

```

```swift
func func0() {
func func1() {
func func2() {
func func3() {
func func4() { func func5() {
}
}
}
}
}
}

```

```swift
enum Class0 { enum Class1 {} }

```

```swift
func func0() {
func func1() {
func func2() {
func func3() {
func func4() { func func5() {
}
}
}
}
}
}

```

```swift
enum Enum0 { enum Enum1 { case Case } }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class A { class B { ↓class C {} } }

```

```swift
struct A { struct B { ↓struct C {} } }

```

```swift
enum A { enum B { ↓enum C {} } }

```

```swift
func func0() {
func func1() {
func func2() {
func func3() {
func func4() { func func5() {
↓func func6() {
}
}
}
}
}
}
}

```

</details>



## No Fallthrough Only

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`no_fallthrough_only` | Enabled | No | idiomatic | No | 3.0.0 

Fallthroughs can only be used if the `case` contains at least one other statement.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
switch myvar {
case 1:
    var a = 1
    fallthrough
case 2:
    var a = 2
}
```

```swift
switch myvar {
case "a":
    var one = 1
    var two = 2
    fallthrough
case "b": /* comment */
    var three = 3
}
```

```swift
switch myvar {
case 1:
   let one = 1
case 2:
   // comment
   var two = 2
}
```

```swift
switch myvar {
case MyFunc(x: [1, 2, YourFunc(a: 23)], y: 2):
    var three = 3
    fallthrough
default:
    var three = 4
}
```

```swift
switch myvar {
case .alpha:
    var one = 1
case .beta:
    var three = 3
    fallthrough
default:
    var four = 4
}
```

```swift
let aPoint = (1, -1)
switch aPoint {
case let (x, y) where x == y:
    let A = "A"
case let (x, y) where x == -y:
    let B = "B"
    fallthrough
default:
    let C = "C"
}
```

```swift
switch myvar {
case MyFun(with: { $1 }):
    let one = 1
    fallthrough
case "abc":
    let two = 2
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
switch myvar {
case 1:
    ↓fallthrough
case 2:
    var a = 1
}
```

```swift
switch myvar {
case 1:
    var a = 2
case 2:
    ↓fallthrough
case 3:
    var a = 3
}
```

```swift
switch myvar {
case 1: // comment
    ↓fallthrough
}
```

```swift
switch myvar {
case 1: /* multi
    line
    comment */
    ↓fallthrough
case 2:
    var a = 2
}
```

```swift
switch myvar {
case MyFunc(x: [1, 2, YourFunc(a: 23)], y: 2):
    ↓fallthrough
default:
    var three = 4
}
```

```swift
switch myvar {
case .alpha:
    var one = 1
case .beta:
    ↓fallthrough
case .gamma:
    var three = 3
default:
  var four = 4
}
```

```swift
let aPoint = (1, -1)
switch aPoint {
case let (x, y) where x == y:
    let A = "A"
case let (x, y) where x == -y:
    ↓fallthrough
default:
    let B = "B"
}
```

```swift
switch myvar {
case MyFun(with: { $1 }):
    ↓fallthrough
case "abc":
    let two = 2
}
```

</details>



## Notification Center Detachment

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`notification_center_detachment` | Enabled | No | lint | No | 3.0.0 

An object should only remove itself as an observer in `deinit`.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Foo { 
   deinit {
       NotificationCenter.default.removeObserver(self)
   }
}

```

```swift
class Foo { 
   func bar() {
       NotificationCenter.default.removeObserver(otherObject)
   }
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class Foo { 
   func bar() {
       ↓NotificationCenter.default.removeObserver(self)
   }
}

```

</details>



## Opening Brace Spacing

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`opening_brace` | Enabled | Yes | style | No | 3.0.0 

Opening braces should be preceded by a single space and on the same line as the declaration.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func abc() {
}
```

```swift
[].map() { $0 }
```

```swift
[].map({ })
```

```swift
if let a = b { }
```

```swift
while a == b { }
```

```swift
guard let a = b else { }
```

```swift
if
	let a = b,
	let c = d
	where a == c
{ }
```

```swift
while
	let a = b,
	let c = d
	where a == c
{ }
```

```swift
guard
	let a = b,
	let c = d
	where a == c else
{ }
```

```swift
struct Rule {}

```

```swift
struct Parent {
	struct Child {
		let foo: Int
	}
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func abc()↓{
}
```

```swift
func abc()
	↓{ }
```

```swift
[].map()↓{ $0 }
```

```swift
[].map( ↓{ } )
```

```swift
if let a = b↓{ }
```

```swift
while a == b↓{ }
```

```swift
guard let a = b else↓{ }
```

```swift
if
	let a = b,
	let c = d
	where a == c↓{ }
```

```swift
while
	let a = b,
	let c = d
	where a == c↓{ }
```

```swift
guard
	let a = b,
	let c = d
	where a == c else↓{ }
```

```swift
struct Rule↓{}

```

```swift
struct Rule
↓{
}

```

```swift
struct Rule

	↓{
}

```

```swift
struct Parent {
	struct Child
	↓{
		let foo: Int
	}
}

```

</details>



## Operator Usage Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`operator_usage_whitespace` | Disabled | Yes | style | No | 3.0.0 

Operators should be surrounded by a single whitespace when they are being used.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let foo = 1 + 2

```

```swift
let foo = 1 > 2

```

```swift
let foo = !false

```

```swift
let foo: Int?

```

```swift
let foo: Array<String>

```

```swift
let model = CustomView<Container<Button>, NSAttributedString>()

```

```swift
let foo: [String]

```

```swift
let foo = 1 + 
  2

```

```swift
let range = 1...3

```

```swift
let range = 1 ... 3

```

```swift
let range = 1..<3

```

```swift
#if swift(>=3.0)
    foo()
#endif

```

```swift
array.removeAtIndex(-200)

```

```swift
let name = "image-1"

```

```swift
button.setImage(#imageLiteral(resourceName: "image-1"), for: .normal)

```

```swift
let doubleValue = -9e-11

```

```swift
let foo = GenericType<(UIViewController) -> Void>()

```

```swift
let foo = Foo<Bar<T>, Baz>()

```

```swift
let foo = SignalProducer<Signal<Value, Error>, Error>([ self.signal, next ]).flatten(.concat)

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let foo = 1↓+2

```

```swift
let foo = 1↓   + 2

```

```swift
let foo = 1↓   +    2

```

```swift
let foo = 1↓ +    2

```

```swift
let foo↓=1↓+2

```

```swift
let foo↓=1 + 2

```

```swift
let foo↓=bar

```

```swift
let range = 1↓ ..<  3

```

```swift
let foo = bar↓   ?? 0

```

```swift
let foo = bar↓??0

```

```swift
let foo = bar↓ !=  0

```

```swift
let foo = bar↓ !==  bar2

```

```swift
let v8 = Int8(1)↓  << 6

```

```swift
let v8 = 1↓ <<  (6)

```

```swift
let v8 = 1↓ <<  (6)
 let foo = 1 > 2

```

</details>



## Operator Function Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`operator_whitespace` | Enabled | No | style | No | 3.0.0 

Operators should be surrounded by a single whitespace when defining them.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func <| (lhs: Int, rhs: Int) -> Int {}

```

```swift
func <|< <A>(lhs: A, rhs: A) -> A {}

```

```swift
func abc(lhs: Int, rhs: Int) -> Int {}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓func <|(lhs: Int, rhs: Int) -> Int {}

```

```swift
↓func <|<<A>(lhs: A, rhs: A) -> A {}

```

```swift
↓func <|  (lhs: Int, rhs: Int) -> Int {}

```

```swift
↓func <|<  <A>(lhs: A, rhs: A) -> A {}

```

```swift
↓func  <| (lhs: Int, rhs: Int) -> Int {}

```

```swift
↓func  <|< <A>(lhs: A, rhs: A) -> A {}

```

</details>



## Private over fileprivate

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`private_over_fileprivate` | Enabled | Yes | idiomatic | No | 3.0.0 

Prefer `private` over `fileprivate` declarations.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
extension String {}
```

```swift
private extension String {}
```

```swift
public 
 enum MyEnum {}
```

```swift
open extension 
 String {}
```

```swift
internal extension String {}
```

```swift
extension String {
fileprivate func Something(){}
}
```

```swift
class MyClass {
fileprivate let myInt = 4
}
```

```swift
class MyClass {
fileprivate(set) var myInt = 4
}
```

```swift
struct Outter {
struct Inter {
fileprivate struct Inner {}
}
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓fileprivate enum MyEnum {}
```

```swift
↓fileprivate class MyClass {
fileprivate(set) var myInt = 4
}
```

</details>



## Private Unit Test

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`private_unit_test` | Enabled | No | lint | No | 3.0.0 

Unit tests marked private are silently skipped.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 }
```

```swift
internal class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 }
```

```swift
public class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 }
```

```swift
private class Foo: NSObject { func test1() {}
 internal func test2() {}
 public func test3() {}
 }
```

```swift
private class Foo { func test1() {}
 internal func test2() {}
 public func test3() {}
 }
```

```swift
public class FooTest: XCTestCase { func test1(param: Int) {}
 }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
private ↓class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 private func test4() {}
 }
```

```swift
class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 private ↓func test4() {}
 }
```

```swift
internal class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 private ↓func test4() {}
 }
```

```swift
public class FooTest: XCTestCase { func test1() {}
 internal func test2() {}
 public func test3() {}
 private ↓func test4() {}
 }
```

</details>



## Protocol Property Accessors Order

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`protocol_property_accessors_order` | Enabled | Yes | style | No | 3.0.0 

When declaring properties in protocols, the order of accessors should be `get set`.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
protocol Foo {
 var bar: String { get set }
 }
```

```swift
protocol Foo {
 var bar: String { get }
 }
```

```swift
protocol Foo {
 var bar: String { set }
 }
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
protocol Foo {
 var bar: String { ↓set get }
 }
```

</details>



## Quick Discouraged Call

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`quick_discouraged_call` | Disabled | No | lint | No | 3.0.0 

Discouraged call inside 'describe' and/or 'context' block.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           beforeEach {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           beforeEach {
               let foo = Foo()
               foo.toto()
           }
           afterEach {
               let foo = Foo()
               foo.toto()
           }
           describe("bar") {
           }
           context("bar") {
           }
           it("bar") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
          itBehavesLike("bar")
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           it("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           afterEach { toto.append(foo) }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xcontext("foo") {
           afterEach { toto.append(foo) }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xdescribe("foo") {
           afterEach { toto.append(foo) }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           xit("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fcontext("foo") {
           afterEach { toto.append(foo) }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fdescribe("foo") {
           afterEach { toto.append(foo) }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           fit("does something") {
               let foo = Foo()
               foo.toto()
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       fitBehavesLike("foo")
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xitBehavesLike("foo")
   }
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class TotoTests {
   override func spec() {
       describe("foo") {
           let foo = Foo()
       }
   }
}
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           let foo = ↓Foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           let foo = ↓Foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("foo") {
               let foo = ↓Foo()
           }
           context("bar") {
               let foo = ↓Foo()
               ↓foo.bar()
               it("does something") {
                   let foo = Foo()
                   foo.toto()
               }
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           context("foo") {
               context("foo") {
                   beforeEach {
                       let foo = Foo()
                       foo.toto()
                   }
                   it("bar") {
                   }
                   context("foo") {
                       let foo = ↓Foo()
                   }
               }
           }
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           let foo = ↓Foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       sharedExamples("foo") {
           let foo = ↓Foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       describe("foo") {
           ↓foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       context("foo") {
           ↓foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       sharedExamples("foo") {
           ↓foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xdescribe("foo") {
           let foo = ↓Foo()
       }
       fdescribe("foo") {
           let foo = ↓Foo()
       }
   }
}

```

```swift
class TotoTests: QuickSpec {
   override func spec() {
       xcontext("foo") {
           let foo = ↓Foo()
       }
       fcontext("foo") {
           let foo = ↓Foo()
       }
   }
}

```

</details>



## Redundant Discardable Let

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`redundant_discardable_let` | Enabled | Yes | style | No | 3.0.0 

Prefer `_ = foo()` over `let _ = foo()` when discarding a result from a function.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
_ = foo()

```

```swift
if let _ = foo() { }

```

```swift
guard let _ = foo() else { return }

```

```swift
let _: ExplicitType = foo()
```

```swift
while let _ = SplashStyle(rawValue: maxValue) { maxValue += 1 }

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓let _ = foo()

```

```swift
if _ = foo() { ↓let _ = bar() }

```

</details>



## Redundant Optional Initialization

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`redundant_optional_initialization` | Enabled | Yes | idiomatic | No | 3.0.0 

Initializing an optional variable with nil is redundant.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
var myVar: Int?

```

```swift
let myVar: Int? = nil

```

```swift
var myVar: Int? = 0

```

```swift
func foo(bar: Int? = 0) { }

```

```swift
var myVar: Optional<Int>

```

```swift
let myVar: Optional<Int> = nil

```

```swift
var myVar: Optional<Int> = 0

```

```swift
var foo: Int? {
   if bar != nil { }
   return 0
}

```

```swift
var foo: Int? = {
   if bar != nil { }
   return 0
}()

```

```swift
lazy var test: Int? = nil
```

```swift
func funcName() {
    var myVar: String?
}
```

```swift
func funcName() {
    let myVar: String? = nil
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
var myVar: Int?↓ = nil

```

```swift
var myVar: Optional<Int>↓ = nil

```

```swift
var myVar: Int?↓=nil

```

```swift
var myVar: Optional<Int>↓=nil

```

```swift
func funcName() {
    var myVar: String?↓ = nil
}
```

</details>



## Redundant Set Access Control Rule

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`redundant_set_access_control` | Enabled | No | idiomatic | No | 4.1.0 

Property setter access level shouldn't be explicit if it's the same as the variable access level.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
private(set) public var foo: Int
```

```swift
public let foo: Int
```

```swift
public var foo: Int
```

```swift
var foo: Int
```

```swift
private final class A {
    private(set) var value: Int
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓private(set) private var foo: Int
```

```swift
↓fileprivate(set) fileprivate var foo: Int
```

```swift
↓internal(set) internal var foo: Int
```

```swift
↓public(set) public var foo: Int
```

```swift
open class Foo {
    ↓open(set) open var bar: Int
}
```

```swift
class A {
    ↓internal(set) var value: Int
}
```

```swift
fileprivate class A {
    ↓fileprivate(set) var value: Int
}
```

</details>



## Redundant String Enum Value

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`redundant_string_enum_value` | Enabled | No | idiomatic | No | 3.0.0 

String enum values can be omitted when they are equal to the enumcase name.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
enum Numbers: String {
 case one
 case two
}

```

```swift
enum Numbers: Int {
 case one = 1
 case two = 2
}

```

```swift
enum Numbers: String {
 case one = "ONE"
 case two = "TWO"
}

```

```swift
enum Numbers: String {
 case one = "ONE"
 case two = "two"
}

```

```swift
enum Numbers: String {
 case one, two
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
enum Numbers: String {
 case one = ↓"one"
 case two = ↓"two"
}

```

```swift
enum Numbers: String {
 case one = ↓"one", two = ↓"two"
}

```

```swift
enum Numbers: String {
 case one, two = ↓"two"
}

```

</details>



## Redundant Void Return

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`redundant_void_return` | Enabled | Yes | idiomatic | No | 3.0.0 

Returning Void in a function declaration is redundant.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func foo() {}

```

```swift
func foo() -> Int {}

```

```swift
func foo() -> Int -> Void {}

```

```swift
func foo() -> VoidResponse

```

```swift
let foo: Int -> Void

```

```swift
func foo() -> Int -> () {}

```

```swift
let foo: Int -> ()

```

```swift
func foo() -> ()?

```

```swift
func foo() -> ()!

```

```swift
func foo() -> Void?

```

```swift
func foo() -> Void!

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func foo()↓ -> Void {}

```

```swift
protocol Foo {
 func foo()↓ -> Void
}

```

```swift
func foo()↓ -> () {}

```

```swift
protocol Foo {
 func foo()↓ -> ()
}

```

</details>



## Returning Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`return_arrow_whitespace` | Enabled | Yes | style | No | 3.0.0 

Return arrow and return type should be separated by a single space or on a separate line.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func abc() -> Int {}

```

```swift
func abc() -> [Int] {}

```

```swift
func abc() -> (Int, Int) {}

```

```swift
var abc = {(param: Int) -> Void in }

```

```swift
func abc() ->
    Int {}

```

```swift
func abc()
    -> Int {}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func abc()↓->Int {}

```

```swift
func abc()↓->[Int] {}

```

```swift
func abc()↓->(Int, Int) {}

```

```swift
func abc()↓-> Int {}

```

```swift
func abc()↓ ->Int {}

```

```swift
func abc()↓  ->  Int {}

```

```swift
var abc = {(param: Int)↓ ->Bool in }

```

```swift
var abc = {(param: Int)↓->Bool in }

```

</details>



## Shorthand Operator

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`shorthand_operator` | Enabled | No | style | No | 3.0.0 

Prefer shorthand operators (+=, -=, *=, /=) over doing the operation and assigning.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
foo -= 1
```

```swift
foo -= variable
```

```swift
foo -= bar.method()
```

```swift
self.foo = foo - 1
```

```swift
foo = self.foo - 1
```

```swift
page = ceilf(currentOffset - pageWidth)
```

```swift
foo = aMethod(foo - bar)
```

```swift
foo = aMethod(bar - foo)
```

```swift
foo /= 1
```

```swift
foo /= variable
```

```swift
foo /= bar.method()
```

```swift
self.foo = foo / 1
```

```swift
foo = self.foo / 1
```

```swift
page = ceilf(currentOffset / pageWidth)
```

```swift
foo = aMethod(foo / bar)
```

```swift
foo = aMethod(bar / foo)
```

```swift
foo += 1
```

```swift
foo += variable
```

```swift
foo += bar.method()
```

```swift
self.foo = foo + 1
```

```swift
foo = self.foo + 1
```

```swift
page = ceilf(currentOffset + pageWidth)
```

```swift
foo = aMethod(foo + bar)
```

```swift
foo = aMethod(bar + foo)
```

```swift
foo *= 1
```

```swift
foo *= variable
```

```swift
foo *= bar.method()
```

```swift
self.foo = foo * 1
```

```swift
foo = self.foo * 1
```

```swift
page = ceilf(currentOffset * pageWidth)
```

```swift
foo = aMethod(foo * bar)
```

```swift
foo = aMethod(bar * foo)
```

```swift
var helloWorld = "world!"
 helloWorld = "Hello, " + helloWorld
```

```swift
angle = someCheck ? angle : -angle
```

```swift
seconds = seconds * 60 + value
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓foo = foo - 1

```

```swift
↓foo = foo - aVariable

```

```swift
↓foo = foo - bar.method()

```

```swift
↓foo.aProperty = foo.aProperty - 1

```

```swift
↓self.aProperty = self.aProperty - 1

```

```swift
↓foo = foo / 1

```

```swift
↓foo = foo / aVariable

```

```swift
↓foo = foo / bar.method()

```

```swift
↓foo.aProperty = foo.aProperty / 1

```

```swift
↓self.aProperty = self.aProperty / 1

```

```swift
↓foo = foo + 1

```

```swift
↓foo = foo + aVariable

```

```swift
↓foo = foo + bar.method()

```

```swift
↓foo.aProperty = foo.aProperty + 1

```

```swift
↓self.aProperty = self.aProperty + 1

```

```swift
↓foo = foo * 1

```

```swift
↓foo = foo * aVariable

```

```swift
↓foo = foo * bar.method()

```

```swift
↓foo.aProperty = foo.aProperty * 1

```

```swift
↓self.aProperty = self.aProperty * 1

```

```swift
n = n + i / outputLength
```

```swift
n = n - i / outputLength
```

</details>


## Statement Position

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`statement_position` | Enabled | Yes | style | No | 3.0.0 

Else and catch should be on the same line, one space after the previous declaration.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
} else if {
```

```swift
} else {
```

```swift
} catch {
```

```swift
"}else{"
```

```swift
struct A { let catchphrase: Int }
let a = A(
 catchphrase: 0
)
```

```swift
struct A { let `catch`: Int }
let a = A(
 `catch`: 0
)
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓}else if {
```

```swift
↓}  else {
```

```swift
↓}
catch {
```

```swift
↓}
	  catch {
```

</details>



## Strict fileprivate

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`strict_fileprivate` | Disabled | No | idiomatic | No | 3.0.0 

`fileprivate` should be avoided.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
extension String {}
```

```swift
private extension String {}
```

```swift
public 
 extension String {}
```

```swift
open extension 
 String {}
```

```swift
internal extension String {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓fileprivate extension String {}
```

```swift
↓fileprivate 
 extension String {}
```

```swift
↓fileprivate extension 
 String {}
```

```swift
extension String {
↓fileprivate func Something(){}
}
```

```swift
class MyClass {
↓fileprivate let myInt = 4
}
```

```swift
class MyClass {
↓fileprivate(set) var myInt = 4
}
```

```swift
struct Outter {
struct Inter {
↓fileprivate struct Inner {}
}
}
```

</details>



## Superfluous Disable Command

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`superfluous_disable_command` | Enabled | No | lint | No | 3.0.0 

SwiftLint 'disable' commands are superfluous when the disabled rule would not have triggered a violation in the disabled region.



## Switch and Case Statement Alignment

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`switch_case_alignment` | Enabled | No | style | No | 3.0.0 

Case statements should vertically align with their enclosing switch statement, or indented if configured otherwise.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
switch someBool {
case true: // case 1
    print('red')
case false:
    /*
    case 2
    */
    if case let .someEnum(val) = someFunc() {
        print('blue')
    }
}
enum SomeEnum {
    case innocent
}
```

```swift
if aBool {
    switch someBool {
    case true:
        print('red')
    case false:
        print('blue')
    }
}
```

```swift
switch someInt {
// comments ignored
case 0:
    // zero case
    print('Zero')
case 1:
    print('One')
default:
    print('Some other number')
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
switch someBool {
    ↓case true:
        print("red")
    ↓case false:
        print("blue")
}
```

```swift
if aBool {
    switch someBool {
        ↓case true:
            print('red')
        ↓case false:
            print('blue')
    }
}
```

```swift
switch someInt {
    ↓case 0:
        print('Zero')
    ↓case 1:
        print('One')
    ↓default:
        print('Some other number')
}
```

```swift
switch someBool {
case true:
    print('red')
    ↓case false:
        print('blue')
}
```

```swift
if aBool {
    switch someBool {
        ↓case true:
        print('red')
    case false:
    print('blue')
    }
}
```

</details>



## Syntactic Sugar

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`syntactic_sugar` | Enabled | No | idiomatic | No | 3.0.0 

Shorthand syntactic sugar should be used, i.e. [Int] instead of Array<Int>.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let x: [Int]
```

```swift
let x: [Int: String]
```

```swift
let x: Int?
```

```swift
func x(a: [Int], b: Int) -> [Int: Any]
```

```swift
let x: Int!
```

```swift
extension Array { 
 func x() { } 
 }
```

```swift
extension Dictionary { 
 func x() { } 
 }
```

```swift
let x: CustomArray<String>
```

```swift
var currentIndex: Array<OnboardingPage>.Index?
```

```swift
func x(a: [Int], b: Int) -> Array<Int>.Index
```

```swift
unsafeBitCast(nonOptionalT, to: Optional<T>.self)
```

```swift
type is Optional<String>.Type
```

```swift
let x: Foo.Optional<String>
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let x: ↓Array<String>
```

```swift
let x: ↓Dictionary<Int, String>
```

```swift
let x: ↓Optional<Int>
```

```swift
let x: ↓ImplicitlyUnwrappedOptional<Int>
```

```swift
func x(a: ↓Array<Int>, b: Int) -> [Int: Any]
```

```swift
func x(a: [Int], b: Int) -> ↓Dictionary<Int, String>
```

```swift
func x(a: ↓Array<Int>, b: Int) -> ↓Dictionary<Int, String>
```

```swift
let x = ↓Array<String>.array(of: object)
```

```swift
let x: ↓Swift.Optional<String>
```

</details>



## Todo

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`todo` | Enabled | No | lint | No | 3.0.0 

TODOs and FIXMEs should be resolved.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
// notaTODO:

```

```swift
// notaFIXME:

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
// ↓TODO:

```

```swift
// ↓FIXME:

```

```swift
// ↓TODO(note)

```

```swift
// ↓FIXME(note)

```

```swift
/* ↓FIXME: */

```

```swift
/* ↓TODO: */

```

```swift
/** ↓FIXME: */

```

```swift
/** ↓TODO: */

```

</details>



## Trailing Comma

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`trailing_comma` | Enabled | Yes | style | No | 3.0.0 

Trailing commas in arrays and dictionaries should be avoided/enforced.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let foo = [1, 2, 3]

```

```swift
let foo = []

```

```swift
let foo = [:]

```

```swift
let foo = [1: 2, 2: 3]

```

```swift
let foo = [Void]()

```

```swift
let example = [ 1,
 2
 // 3,
]
```

```swift
foo([1: "\(error)"])

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let foo = [1, 2, 3↓,]

```

```swift
let foo = [1, 2, 3↓, ]

```

```swift
let foo = [1, 2, 3   ↓,]

```

```swift
let foo = [1: 2, 2: 3↓, ]

```

```swift
struct Bar {
 let foo = [1: 2, 2: 3↓, ]
}

```

```swift
let foo = [1, 2, 3↓,] + [4, 5, 6↓,]

```

```swift
let example = [ 1,
2↓,
 // 3,
]
```

```swift
let foo = ["אבג", "αβγ", "🇺🇸"↓,]

```

```swift
class C {
 #if true
 func f() {
 let foo = [1, 2, 3↓,]
 }
 #endif
}
```

```swift
foo([1: "\(error)"↓,])

```

</details>



## Trailing Newline

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`trailing_newline` | Enabled | Yes | style | No | 3.0.0 

Files should have a single trailing newline.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let a = 0

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let a = 0
```

```swift
let a = 0


```

</details>



## Trailing Semicolon

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`trailing_semicolon` | Enabled | Yes | idiomatic | No | 3.0.0 

Lines should not have trailing semicolons.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let a = 0

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let a = 0↓;

```

```swift
let a = 0↓;
let b = 1

```

```swift
let a = 0↓;;

```

```swift
let a = 0↓;    ;;

```

```swift
let a = 0↓; ; ;

```

</details>



## Trailing Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`trailing_whitespace` | Enabled | Yes | style | No | 3.0.0 

Lines should not have trailing whitespace.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let name: String

```

```swift
//

```

```swift
// 

```

```swift
let name: String //

```

```swift
let name: String // 

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let name: String 

```

```swift
/* */ let name: String 

```

</details>



## Type Body Length

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`type_body_length` | Enabled | No | metrics | No | 3.0.0 

Type bodies should not span too many lines.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
class Abc {









































































































































































































}

```

```swift
class Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/
}

```

```swift
struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
struct Abc {









































































































































































































}

```

```swift
struct Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/
}

```

```swift
enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
enum Abc {









































































































































































































}

```

```swift
enum Abc {
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
// this is a comment
}

```

```swift
enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0

/* this is
a multiline comment
*/
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
↓class Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
↓struct Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

```swift
↓enum Abc {
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
let abc = 0
}

```

</details>



## Type Name

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`type_name` | Enabled | No | idiomatic | No | 3.0.0 

Type name should only contain alphanumeric characters, start with an uppercase character and span between 3 and 40 characters in length.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class MyType {}
```

```swift
private class _MyType {}
```

```swift
class AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
struct MyType {}
```

```swift
private struct _MyType {}
```

```swift
struct AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
enum MyType {}
```

```swift
private enum _MyType {}
```

```swift
enum AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
typealias Foo = Void
```

```swift
private typealias Foo = Void
```

```swift
protocol Foo {
 associatedtype Bar
 }
```

```swift
protocol Foo {
 associatedtype Bar: Equatable
 }
```

```swift
enum MyType {
case value
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class ↓myType {}
```

```swift
class ↓_MyType {}
```

```swift
private class ↓MyType_ {}
```

```swift
class ↓My {}
```

```swift
class ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
struct ↓myType {}
```

```swift
struct ↓_MyType {}
```

```swift
private struct ↓MyType_ {}
```

```swift
struct ↓My {}
```

```swift
struct ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
enum ↓myType {}
```

```swift
enum ↓_MyType {}
```

```swift
private enum ↓MyType_ {}
```

```swift
enum ↓My {}
```

```swift
enum ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA {}
```

```swift
typealias ↓X = Void
```

```swift
private typealias ↓Foo_Bar = Void
```

```swift
private typealias ↓foo = Void
```

```swift
typealias ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA = Void
```

```swift
protocol Foo {
 associatedtype ↓X
 }
```

```swift
protocol Foo {
 associatedtype ↓Foo_Bar: Equatable
 }
```

```swift
protocol Foo {
 associatedtype ↓AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
 }
```

</details>



## Unneeded Break in Switch

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`unneeded_break_in_switch` | Enabled | No | idiomatic | No | 3.0.0 

Avoid using unneeded break statements.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
switch foo {
case .bar:
    break
}
```

```swift
switch foo {
default:
    break
}
```

```swift
switch foo {
case .bar:
    for i in [0, 1, 2] { break }
}
```

```swift
switch foo {
case .bar:
    if true { break }
}
```

```swift
switch foo {
case .bar:
    something()
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
switch foo {
case .bar:
    something()
    ↓break
}
```

```swift
switch foo {
case .bar:
    something()
    ↓break // comment
}
```

```swift
switch foo {
default:
    something()
    ↓break
}
```

```swift
switch foo {
case .foo, .foo2 where condition:
    something()
    ↓break
}
```

</details>



## Unused Closure Parameter

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`unused_closure_parameter` | Enabled | Yes | lint | No | 3.0.0 

Unused parameter in a closure should be replaced with _.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
[1, 2].map { $0 + 1 }

```

```swift
[1, 2].map({ $0 + 1 })

```

```swift
[1, 2].map { number in
 number + 1 
}

```

```swift
[1, 2].map { _ in
 3 
}

```

```swift
[1, 2].something { number, idx in
 return number * idx
}

```

```swift
let isEmpty = [1, 2].isEmpty()

```

```swift
violations.sorted(by: { lhs, rhs in 
 return lhs.location > rhs.location
})

```

```swift
rlmConfiguration.migrationBlock.map { rlmMigration in
return { migration, schemaVersion in
rlmMigration(migration.rlmMigration, schemaVersion)
}
}
```

```swift
genericsFunc { (a: Type, b) in
a + b
}

```

```swift
var label: UILabel = { (lbl: UILabel) -> UILabel in
   lbl.backgroundColor = .red
   return lbl
}(UILabel())

```

```swift
hoge(arg: num) { num in
  return num
}

```

```swift
({ (manager: FileManager) in
  print(manager)
})(FileManager.default)
```

```swift
withPostSideEffect { input in
    if true { print("\(input)") }
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
[1, 2].map { ↓number in
 return 3
}

```

```swift
[1, 2].map { ↓number in
 return numberWithSuffix
}

```

```swift
[1, 2].map { ↓number in
 return 3 // number
}

```

```swift
[1, 2].map { ↓number in
 return 3 "number"
}

```

```swift
[1, 2].something { number, ↓idx in
 return number
}

```

```swift
genericsFunc { (↓number: TypeA, idx: TypeB) in return idx
}

```

```swift
hoge(arg: num) { ↓num in
}

```

```swift
fooFunc { ↓아 in
 }
```

```swift
func foo () {
 bar { ↓number in
 return 3
}

```

</details>



## Unused Enumerated

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`unused_enumerated` | Enabled | No | idiomatic | No | 3.0.0 

When the index or the item is not used, `.enumerated()` can be removed.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
for (idx, foo) in bar.enumerated() { }

```

```swift
for (_, foo) in bar.enumerated().something() { }

```

```swift
for (_, foo) in bar.something() { }

```

```swift
for foo in bar.enumerated() { }

```

```swift
for foo in bar { }

```

```swift
for (idx, _) in bar.enumerated().something() { }

```

```swift
for (idx, _) in bar.something() { }

```

```swift
for idx in bar.indices { }

```

```swift
for (section, (event, _)) in data.enumerated() {}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
for (↓_, foo) in bar.enumerated() { }

```

```swift
for (↓_, foo) in abc.bar.enumerated() { }

```

```swift
for (↓_, foo) in abc.something().enumerated() { }

```

```swift
for (idx, ↓_) in bar.enumerated() { }

```

</details>



## Unused Optional Binding

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`unused_optional_binding` | Enabled | No | style | No | 3.0.0 

Prefer `!= nil` over `let _ =`

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
if let bar = Foo.optionalValue {
}

```

```swift
if let (_, second) = getOptionalTuple() {
}

```

```swift
if let (_, asd, _) = getOptionalTuple(), let bar = Foo.optionalValue {
}

```

```swift
if foo() { let _ = bar() }

```

```swift
if foo() { _ = bar() }

```

```swift
if case .some(_) = self {}
```

```swift
if let point = state.find({ _ in true }) {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
if let ↓_ = Foo.optionalValue {
}

```

```swift
if let a = Foo.optionalValue, let ↓_ = Foo.optionalValue2 {
}

```

```swift
guard let a = Foo.optionalValue, let ↓_ = Foo.optionalValue2 {
}

```

```swift
if let (first, second) = getOptionalTuple(), let ↓_ = Foo.optionalValue {
}

```

```swift
if let (first, _) = getOptionalTuple(), let ↓_ = Foo.optionalValue {
}

```

```swift
if let (_, second) = getOptionalTuple(), let ↓_ = Foo.optionalValue {
}

```

```swift
if let ↓(_, _, _) = getOptionalTuple(), let bar = Foo.optionalValue {
}

```

```swift
func foo() {
if let ↓_ = bar {
}

```

```swift
if case .some(let ↓_) = self {}
```

</details>



## Valid IBInspectable

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`valid_ibinspectable` | Enabled | No | lint | No | 3.0.0 

@IBInspectable should be applied to variables only, have its type explicit and be of a supported type

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Foo {
  @IBInspectable private var x: Int
}

```

```swift
class Foo {
  @IBInspectable private var x: String?
}

```

```swift
class Foo {
  @IBInspectable private var x: String!
}

```

```swift
class Foo {
  @IBInspectable private var count: Int = 0
}

```

```swift
class Foo {
  private var notInspectable = 0
}

```

```swift
class Foo {
  private let notInspectable: Int
}

```

```swift
class Foo {
  private let notInspectable: UInt8
}

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class Foo {
  @IBInspectable private ↓let count: Int
}

```

```swift
class Foo {
  @IBInspectable private ↓var insets: UIEdgeInsets
}

```

```swift
class Foo {
  @IBInspectable private ↓var count = 0
}

```

```swift
class Foo {
  @IBInspectable private ↓var count: Int?
}

```

```swift
class Foo {
  @IBInspectable private ↓var count: Int!
}

```

```swift
class Foo {
  @IBInspectable private ↓var x: ImplicitlyUnwrappedOptional<Int>
}

```

```swift
class Foo {
  @IBInspectable private ↓var count: Optional<Int>
}

```

```swift
class Foo {
  @IBInspectable private ↓var x: Optional<String>
}

```

```swift
class Foo {
  @IBInspectable private ↓var x: ImplicitlyUnwrappedOptional<String>
}

```

</details>



## Vertical Parameter Alignment

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`vertical_parameter_alignment` | Enabled | No | style | No | 3.0.0 

Function parameters should be aligned vertically if they're in multiple lines in a declaration.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                      dictionary: [String: SourceKitRepresentable]) { }

```

```swift
func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                      dictionary: [String: SourceKitRepresentable]) -> [StyleViolation]

```

```swift
func foo(bar: Int)

```

```swift
func foo(bar: Int) -> String 

```

```swift
func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                      dictionary: [String: SourceKitRepresentable])
                      -> [StyleViolation]

```

```swift
func validateFunction(
   _ file: File, kind: SwiftDeclarationKind,
   dictionary: [String: SourceKitRepresentable]) -> [StyleViolation]

```

```swift
func validateFunction(
   _ file: File, kind: SwiftDeclarationKind,
   dictionary: [String: SourceKitRepresentable]
) -> [StyleViolation]

```

```swift
func regex(_ pattern: String,
           options: NSRegularExpression.Options = [.anchorsMatchLines,
                                                   .dotMatchesLineSeparators]) -> NSRegularExpression

```

```swift
func foo(a: Void,
         b: [String: String] =
           [:]) {
}

```

```swift
func foo(data: (size: CGSize,
                identifier: String)) {}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                  ↓dictionary: [String: SourceKitRepresentable]) { }

```

```swift
func validateFunction(_ file: File, kind: SwiftDeclarationKind,
                       ↓dictionary: [String: SourceKitRepresentable]) { }

```

```swift
func validateFunction(_ file: File,
                  ↓kind: SwiftDeclarationKind,
                  ↓dictionary: [String: SourceKitRepresentable]) { }

```

</details>



## Vertical Whitespace

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`vertical_whitespace` | Enabled | Yes | style | No | 3.0.0 

Limit vertical whitespace to a single empty line.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let abc = 0

```

```swift
let abc = 0


```

```swift
/* bcs 



*/
```

```swift
// bca 


```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let aaaa = 0



```

```swift
struct AAAA {}




```

```swift
class BBBB {}



```

</details>



## Void Return

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`void_return` | Enabled | Yes | style | No | 3.0.0 

Prefer `-> Void` over `-> ()`.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
let abc: () -> Void = {}

```

```swift
let abc: () -> (VoidVoid) = {}

```

```swift
func foo(completion: () -> Void)

```

```swift
let foo: (ConfigurationTests) -> () throws -> Void)

```

```swift
let foo: (ConfigurationTests) ->   () throws -> Void)

```

```swift
let foo: (ConfigurationTests) ->() throws -> Void)

```

```swift
let foo: (ConfigurationTests) -> () -> Void)

```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
let abc: () -> ↓() = {}

```

```swift
let abc: () -> ↓(Void) = {}

```

```swift
let abc: () -> ↓(   Void ) = {}

```

```swift
func foo(completion: () -> ↓())

```

```swift
func foo(completion: () -> ↓(   ))

```

```swift
func foo(completion: () -> ↓(Void))

```

```swift
let foo: (ConfigurationTests) -> () throws -> ↓())

```

</details>



## Weak Delegate

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`weak_delegate` | Enabled | No | lint | No | 3.0.0 

Delegates should be weak to avoid reference cycles.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
class Foo {
  weak var delegate: SomeProtocol?
}

```

```swift
class Foo {
  weak var someDelegate: SomeDelegateProtocol?
}

```

```swift
class Foo {
  weak var delegateScroll: ScrollDelegate?
}

```

```swift
class Foo {
  var scrollHandler: ScrollDelegate?
}

```

```swift
func foo() {
  var delegate: SomeDelegate
}

```

```swift
class Foo {
  var delegateNotified: Bool?
}

```

```swift
protocol P {
 var delegate: AnyObject? { get set }
}

```

```swift
class Foo {
 protocol P {
 var delegate: AnyObject? { get set }
}
}

```

```swift
class Foo {
 var computedDelegate: ComputedDelegate {
 return bar() 
} 
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
class Foo {
  ↓var delegate: SomeProtocol?
}

```

```swift
class Foo {
  ↓var scrollDelegate: ScrollDelegate?
}

```

</details>



## XCTFail Message

Identifier | Enabled by default | Supports autocorrection | Kind | Analyzer | Minimum Swift Compiler Version
--- | --- | --- | --- | --- | ---
`xctfail_message` | Enabled | No | idiomatic | No | 3.0.0 

An XCTFail call should include a description of the assertion.

### Examples

<details>
<summary>Non Triggering Examples</summary>

```swift
func testFoo() {
    XCTFail("bar")
}
```

```swift
func testFoo() {
    XCTFail(bar)
}
```

</details>
<details>
<summary>Triggering Examples</summary>

```swift
func testFoo() {
    ↓XCTFail()
}
```

```swift
func testFoo() {
    ↓XCTFail("")
}
```

</details>



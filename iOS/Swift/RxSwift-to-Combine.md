# Basics

|  | RxSwift | Combine |
| --- | --- | --- |
| Deployment Target | iOS 8.0+ | iOS 13.0+ |
| Platforms supported | iOS, macOS, tvOS, watchOS, Linux | iOS, macOS, tvOS, watchOS, UIKit for Mac |
| Spec | Reactive Extensions (ReactiveX) | Reactive Streams (+ adjustments) |
| Framework Consumption | Third-party | First-party (built-in) |
| Maintained by | Open-Source / Community | Apple |
| UI Bindings | RxCocoa | SwiftUI |


# Core Components

| RxSwift | Combine | Notes |
| --- | --- | --- |
| `AnyObserver` | `AnySubscriber` |  |
| `BehaviorRelay` | nil | Simple wrapper around BehaviorSubject, could be easily recreated in Combine |
| `BehaviorSubject` | `CurrentValueSubject` | This seems to be the type that holds @State under the hood |
| `Completable` | nil |  |
| `CompositeDisposable` | nil |  |
| `ConnectableObservableType` | `ConnectablePublisher` |  |
| `Disposable` | `Cancellable` |  |
| `DisposeBag` | `A collection of AnyCancellables` | Call anyCancellable.store(in: collection), where collection can be an array, a set, or any other RangeReplaceableCollection |
| `Driver` | `BindableObject` (SwiftUI) | Both guarantee no failure, but Driver guarantees delivery on Main Thread. In Combine, SwiftUI recreates the entire view hierarachy on the Main Thread, instead. |
| `Maybe` | nil | Apple removed Publishers.Optional. |
| `Observable` | `Publisher` |  |
| `Observer` | `Subscriber` |  |
| `PublishRelay` | nil | Simple wrapper around PublishSubject, could be easily recreated in Combine |
| `PublishSubject` | `PassthroughSubject` |  |
| `ReplaySubject` | nil |  |
| `ScheduledDisposable` | nil |  |
| `SchedulerType` | `Scheduler` |  |
| `SerialDisposable` | nil |  |
| `Signal` | nil |  |
| `Single` | `Future` | They're only similar in the sense of single emission, but Future shares resources and executes immediately (very strange behavior) |
| `SubjectType` | `Subject` |  |
| `TestScheduler` | nil | There doesn't seem to be an existing testing scheduler for Combine code |


# Operators

| RxSwift | Combine | Notes |
| --- | --- | --- |
| `amb()` | nil |  |
| `asObservable`() | `eraseToAnyPublisher()` |  |
| `asObserver`() | nil |  |
| `bind(to:)` | `assign(to:on:)` | Assign uses a KeyPath which is really nice and useful. RxSwift needs a Binder / ObserverType to bind to. |
| `buffer` | `buffer` |  |
| `catchError` | `catch` |  |
| `catchErrorJustReturn` | `replaceError(with:)` |  |
| `combineLatest` | `combineLatest`, `tryCombineLatest` |  |
| `compactMap` | `compactMap`, `tryCompactMap` |  |
| `concat` | `append`, `prepend` |  |
| `concatMap` | nil |  |
| `create` | nil | Apple removed AnyPublisher with a closure in Xcode 11 beta 3 :-( |
| `debounce` | `debounce` |  |
| `debug` | `print` |  |
| `deferred` | `Publishers.Deferred` |  |
| `delay` | `delay` |  |
| `delaySubscription` | nil |  |
| `dematerialize` | nil |  |
| `distinctUntilChanged` | `removeDuplicates`, `tryRemoveDuplicates` |  |
| `do` | `handleEvents` |  |
| `elementAt` | `output(at:)` |  |
| `empty` | `Empty(completeImmediately: true)` |  |
| `enumerated` | nil |  |
| `error` | `Fail` |  |
| `filter` | `filter`, `tryFilter` |  |
| `first` | `first`, `tryFirst` |  |
| `flatMap` | `flatMap` |  |
| `flatMapFirst` | nil |  |
| `flatMapLatest` | `switchToLatest` |  |
| `from` | nil |  |
| `groupBy` | nil |  |
| `ifEmpty(default:)` | `replaceEmpty(with:)` |  |
| `ifEmpty(switchTo:)` | nil | Could be achieved with composition - replaceEmpty(with: publisher).switchToLatest() |
| `ignoreElements` | `ignoreOutput` |  |
| `interval` | nil |  |
| `just` | `Just` |  |
| `map` | `map`, `tryMap` |  |
| `materialize` | nil |  |
| `merge` | `merge`, `tryMerge` |  |
| `merge(maxConcurrent:)` | `flatMap(maxPublishers:)` |  |
| `multicast` | `multicast` |  |
| `never` | `Publishers.Empty(completeImmediately: false)` |  |
| `observeOn` | `receive(on:)` |  |
| `of` | `Sequence.publisher` | `publisher` property on any `Sequence` or you can use `Publishers.Sequence(sequence:)` directly |
| `publish` | `makeConnectable` |  |
| `range` | nil |  |
| `reduce` | `reduce`, `tryReduce` |  |
| `refCount` | `autoconnect` |  |
| `repeatElement` | nil |  |
| `retry`, `retry(3)` | `retry`, `retry(3)` |  |
| `retryWhen` | nil |  |
| `sample` | nil |  |
| `scan` | `scan`, `tryScan` |  |
| `share` | `share` | There’s no replay or scope in Combine. Could be “faked” with multicast. |
| `skip(3)` | `dropFirst(3)` |  |
| `skipUntil` | `drop(untilOutputFrom:)` |  |
| `skipWhile` | `drop(while:)`, `tryDrop(while:)` |  |
| `startWith` | `prepend` |  |
| `subscribe` | `sink` |  |
| `subscribeOn` | `subscribe(on:)` | RxSwift uses Schedulers. Combine uses RunLoop, DispatchQueue, and OperationQueue. |
| `takeLast` | `last` |  |
| `takeUntil` | `prefix(untilOutputFrom:)` |  |
| `throttle` | `throttle` |  |
| `timeout` | `timeout` |  |
| `timer` | `Timer.publish` |  |
| `toArray()` | `collect()` |  |
| `window` | `collect(Publishers.TimeGroupingStrategy)` | Combine has a TimeGroupingStrategy.byTimeOrCount that could be used as a window. |
| `withLatestFrom` | nil |  |
| `zip` | `zip` |  |

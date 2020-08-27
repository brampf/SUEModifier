# SUEModifier

SwiftUI View modifiers

<p align="center">
<a href="LICENSE.md">
    <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
</a>
<a href="https://swift.org">
    <img src="https://img.shields.io/badge/swift-5.3-brightgreen.svg" alt="Swift 5.3">
</a>

SUE stands for *S*wift*U*I *E*xtras and is a collection of small SwiftUI libraries for various recurring use cases

## Gallery

### ConditionalOverlay
```swift
Rectangle().foregroundColor(.gray)
    .overlay($hidden, Text("Hej Hej").overlayStyle("Goddåg"))
```
![ConditionalOverlay](Doc/ConditionalOverlay.png)

### ObservingOverlay
```swift
Rectangle().foregroundColor(.gray)
    .overlay(Demo(), keyPath: \Demo.test)
```
![ObservingOverlay](Doc/ObservingOverlay.png)

### OverlayStyle
```swift
Rectangle().foregroundColor(.gray)
    .overlay(Text("Bonjour!").overlayStyle("Français"))
```
![OverlayStyle](Doc/OverlayStyle.png)


### Hideable
```swift
HStack{
    Text("Hello").hide($hidden1)
    Text(" World").hide($hidden2)
}
```
![Hideable](Doc/Hideable.png)


## License

MIT license; see [LICENSE](LICENSE.md).
(c) 2020

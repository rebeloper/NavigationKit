# 🧭 NavigationKit

**NavigationKit** is a lightweight library which makes `SwiftUI` navigation super easy to use.

## 💻 Installation
### 📦 Swift Package Manager
Using <a href="https://swift.org/package-manager/" rel="nofollow">Swift Package Manager</a>, add it as a Swift Package in Xcode 11.0 or later, `select File > Swift Packages > Add Package Dependency...` and add the repository URL:
```
https://github.com/rebeloper/NavigationKit.git
```
### ✊ Manual Installation
Download and include the `NavigationKit` folder and files in your codebase.

### 📲 Requirements
- iOS 13+
- Swift 5

## 🎬 Video Tutorial

<p><a href="https://www.youtube.com/watch?v=FPvH3--Q3ys&list=PL_csAAO9PQ8Yj7ZU7n2IJjIsqcFaLcvJN&index=4">NavigationKit on YouTube</a></p>

## 👉 Import

Import `NavigationKit` into your `View`

```
import NavigationKit
```

## 🧳 Features

Here's the list of navigation actions  that you can do with `NavigationKit`:
- [X] present
- [X] present with onDismiss callback
- [X] push
- [X] push as root
- [X] dismiss to root
- [X] dismiss

### Presents

```
Text("Present Second View").presents(SecondView())
```

### Presents with onDismiss callback

```
Text("Present Second View with onDismiss callback").presents(SecondView(), onDismiss: {
    print("Did dismiss SecondView")
})
```

### Pushes

```
NavigationView {
    Text("Push Second View").pushes(SecondView())
}
```

### Pushes as root

```
NavigationView {
    Text("Push Second View").pushesAsRoot(SecondView())
}.rootable()
```

### Dismisses to root

```
Text("Dismiss to Root").dismissesToRoot()
```

### Dismisses

```
Text("Dismiss").dismisses()
```

### TabBarView

Convenience `View` to construct tab bar views with already backed in `NavigationView`, `Navigation()` and `rootable()`.

```
TabBarView(rootView: {
    Tab1RootView()
}, tabItemView: {
    VStack {
        Image(systemName: "1.circle.fill")
        Text("First Tab")
    }
}, tabTag: 0)
```

## ✍️ Contact

<a href="https://rebeloper.com/">rebeloper.com</a> / 
<a href="https://www.youtube.com/rebeloper/">YouTube</a> / 
<a href="https://store.rebeloper.com/">Shop</a> / 
<a href="https://rebeloper.com/mentoring">Mentoring</a>

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


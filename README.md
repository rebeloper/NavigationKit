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

## 👉 Import

Import `NavigationKit` into your `View`

```
import NavigationKit
```

## 🧳 Features

Here's the list of navigation actions  that you can do with `NavigationKit`:
[x] push
[x] push as root
[x] present
[x] presnt as root
[x] dismiss
[x] dismiss to root

## 🛠 How to use

In the views below you will be able to see all the features `NavigationKit` has.

### RootView
```
struct RootView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                Text("Push Second View").pushes(SecondView())
                Text("Push Second View as Root").pushesAsRoot(SecondView())
                Text("Present Second View").presents(SecondView())
                Text("Present Second View with onDismiss callback").presents(SecondView(), onDismiss: {
                    print("Did dismiss SecondView")
                })
                Text("Present Second View in NavigationView").presents(NavigationView { SecondView() })
                Spacer()
            }
            .navigationTitle("Root View")
        }
    }
}
```

### SecondView
```
struct SecondView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Dismiss").dismisses()
            Text("Push Third View").pushes(ThirdView())
//            Text("Push Third View as Root").pushesAsRoot(ThirdView()) // only one view is allowed be the root of the navigation stack; if you comment in this line than you have to comment out the "pushesAsRoot" line in RootView
            Text("Present Third View").presents(ThirdView())
            Spacer()
        }
        .navigationTitle("Second View")
    }
}
```

### ThirdView
```
struct ThirdView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Dismiss").dismisses()
            Text("Push Fourth View").pushes(FourthView())
            Text("Present Fourth View").presents(FourthView())
            Spacer()
        }
        .navigationTitle("Third View")
    }
}
```

### FourthView
```
struct FourthView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Dismiss").dismisses()
            Text("Dismiss to Root").dismissesToRoot()
            Spacer()
        }
        .navigationTitle("Fourth View")
    }
}
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


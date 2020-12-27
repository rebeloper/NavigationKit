# 🧭 NavigationKit

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target iOS 14](https://img.shields.io/badge/deployment%20target-iOS%2014-blueviolet)
![version](https://img.shields.io/github/package-json/v/rebeloper/NavigationKit)

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
- iOS 14+
- Swift 5

## 🎬 Video Tutorial

<p><a href="https://www.youtube.com/watch?v=gk-sTNvOsR8&list=PL_csAAO9PQ8Yj7ZU7n2IJjIsqcFaLcvJN&index=4">SwiftUI Navigation - How to Navigate in SwiftUI Apps on YouTube</a></p>

This tutorial was made for `v.0.1.0.` I have improved and made `NavigationKit` even easier to use since this video. Read on to see how to use the newest version.

## 👉 Import

Import `NavigationKit` into your `View`

```
import NavigationKit
```

## 🧳 Features

Here's the list of the awesome features `NavigationKit` has:
- [X] default / custom transitions
- [X] push
- [X] push to view with id
- [X] pop
- [X] pop to view with id
- [X] pop to root
- [X] present (as modal / full screen)
- [X] may disable swipe down to dismiss on modal
- [X] dismiss
- [X] dismiss to root
- [X] combine `push` with `present` (good for showing Login / Onboarding / Tutorial)
- [X] built in Navigation Bars as view-modifiers (or build and use your own dream nav bar)
- [X] works perfectly with `TabView`

In SwiftUI navigtion is handeled by the `NavigationView` and `NavigationLink`. At the moment these views have some limitations:

- transition animations cannot be turned off or customised;
- we can't navigate back either to root (i.e. the first app view), or to a specific view;
- we can't push programmatically without using a `View`;
- customizing the `NavigationBar` is limited or it has to be done via `UINavigationBar.appearance()` (using `UIKit` 😒);
- `presenting` a view modally is done with the `.sheet` and `.fullScreenCover` view-modifiers adding confusion to the `NavigationLink`'s `push` like pattern; 

`NavigationKitView` is a view that mimics all the behaviours belonging to the standard `NavigationView`, but it adds the features listed here above. You have to wrap your view hierarchy inside a `NavigationKitView`:

```
import NavigationKit

struct RootView: View {
    var body: some View {
        NavigationKitView {
            Tab_0_0_View()
        }
    }
}
```

You can even customise transitions and animations in some different ways. The `NavigationKitView` will apply them to the hierarchy: 

- you could decide to go for no transition at all by creating the navigation stack this way `NavigationStackView(transitionType: .none)`;
- you could create the navigation stack with a custom transition:

```
import NavigationKit

struct RootView: View {
    var body: some View {
        NavigationKitView(transitionType: .custom(.scale)) {
            Tab_0_0_View()
        }
    }
}
```
`NavigationKitView` has a default easing for transitions. The easing can be customised during the initialisation
```
struct RootView: View {
    var body: some View {
        NavigationKitView(transitionType: .custom(.scale), easing: .spring(response: 0.5, dampingFraction: 0.25, blendDuration: 0.5)) {
            Tab_0_0_View()
        }
    }
}
```
**Important:** The above is the recommended way to customise the easing function for your transitions. Please, note that you could even specify the easing this other way:

```
NavigationKitView(transitionType: .custom(AnyTransition.scale.animation(.spring(response: 0.5, dampingFraction: 0.25, blendDuration: 0.5))))
```

Attaching the easing directly to the transition? **Don't do this**. SwiftUI has still some problems with implicit animations attached to transitions, so it may not work. For example, implicit animations attached to a .slide transition won't work.

## ⬅️ Push

In order to navigate forward you have to `push`:

```
import NavigationKit

struct Tab_0_0_View: View {
    
    @EnvironmentObject private var navigation: Navigation
    
    var body: some View {
        VStack {
            Button {
                navigation.push(Tab_0_1_View())
            } label: {
                Text("Next")
            }
            Spacer()
        }
    }
}
```

Make sure you are using a view model in order for values to persist between push/pop operations. SwiftUI resets all the properties of a view marked with `@State` every time the view is removed from a view hierarchy. For the `NavigationKitView` this is a problem because when I come back to a previous view (with a pop operation) I want all my view controls to be as I left them before (for example I want my `TextField`s to contain the text I previously typed in). It seems that the solution to this problem is using the `.id` modifier specifying an id for the views I don't want SwiftUI to reset. According to the Apple documentation the `.id` modifier:

> Summary
> Generates a uniquely identified view that can be inserted or removed.

but again, it seems that this API is currently not working as expected (take a look at this interesting post: https://swiftui-lab.com/swiftui-id/). In order to workaround this problem, then, you have to use `@ObservableObject` when you need to make some state persist between push/pop operations.

```
import NavigationKit

struct Tab_0_0_View: View {
    
    @EnvironmentObject private var navigation: Navigation
    @ObservedObject private var viewModel = Tab_0_0_ViewModel()
    
    var body: some View {
        VStack {
            
            TextField("Type something...", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                self.viewModel.fetchData { (result) in
                    switch result {
                    case .success(let finished):
                        if finished {
                            navigation.push(Tab_0_2_View())
                        } else {
                            print("Something went wrong")
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            } label: {
                Text("Push after model operation")
            }
            Spacer()
        }
    }
}
```

## 🆔 Specifying an ID 

It's not mandatory, but if you want to come back to a specific view at some point later you need to specify an ID for that view:

```
Button {
    navigation.push(Tab_0_1_View(), withId: "Tab_0_1_View")
} label: {
    Text("Next")
}
```
You will be able to `pop` to this view using the `id`. Read on. 🤓

## ➡️ Pop

Pop operation works as the push operation:

```
Button {
    navigation.pop()
} label: {
    Label("Back", systemImage: "chevron.backward")
}
```
which pops to the previous view. You can even specify a destination for your pop operation:
```
Button {
    navigation.pop(to: .view(withId: "Tab_0_1_View"))
} label: {
    Text("Pop to Tab_0_1_View")
}
```
We can also pot to root like so:
```
Button {
    navigation.pop(to: .root)
} label: {
    Text("Pop to Root")
}
```

## 🚧 NavigationBar

`NavigationKit` replaces `NavigationView` altogether. In order to see a navigation bar you can create your own or use the built in view modifiers:

### Inline navigation bar

```
VStack {
    ...
}
.inlineNavigationBar(titleView:
            Text("Tab_0_1_View").bold(),
        leadingView:
            Button {
                navigation.pop()
            } label: {
                Label("Back", systemImage: "chevron.backward")
            },
        trailingView:
            Button {
                navigation.push(Tab_0_2_View())
            } label: {
                Text("Next")
            },
        backgroundView:
            Color(.tertiarySystemBackground).edgesIgnoringSafeArea(.top)
)
```

### Large navigation bar

```
VStack {
    ...
}
.largeNavigationBar(titleView:
            Text("Tab_0_0_View").bold().lineLimit(1),
        leadingView:
            EmptyView(),
        trailingView:
            Button {
                navigation.push(Tab_0_1_View(), withId: "Tab_0_1_View")
            } label: {
                Text("Next")
            },
        backgroundView:
            Color(.tertiarySystemBackground).edgesIgnoringSafeArea(.top)
)
```

## ⬆️ Present

Presenting a modal is a bit diferent than pushing:

1. create a `@State` variable for your view;
2. add a `Sheet` or `FullScreenSheet` view. You must add it to the view hierarchy. Don't worry they are `EmptyView`s;
3. activate the modal with `present()`

**IMPORTANT NOTE**: you can present a `NavigationKitView` inside a `Sheet` / `FullScreenSheet` 😎

```
import NavigationKit

struct Tab_1_0_View: View {
    
    // 1.
    @State private var navigationForTab_0_0_View = false
    @State private var navigationForTab_1_1_View = false
    
    var body: some View {
        VStack {
            Color(.systemTeal)
            
            // 2.
            Sheet(isPresented: $navigationForTab_0_0_View) {
                NavigationKitView {
                    Tab_0_0_View() // <- contains push navigation
                }
            }
            
            FullScreenSheet(isPresented: $navigationForTab_1_1_View) {
                NavigationKitView {
                    Tab_1_1_View()
                }
            }
        }
        .largeNavigationBar(titleView:
                    Text("Tab_1_0_View").bold().lineLimit(1),
                leadingView:
                    Button {
                        // 3.
                        navigationForTab_0_0_View.present()
                    } label: {
                        Text("Present Navigation")
                    },
                trailingView:
                    Button {
                        // 3.
                        navigationForTab_1_1_View.present()
                    } label: {
                        Text("Present")
                    },
                backgroundView:
                    Color(.tertiarySystemBackground).edgesIgnoringSafeArea(.top)
        )
    }
}
```

## ⬇️ Dismiss

Here's how you can dismiss the modal:

1. grab the `presentationMode` environment
2. dimiss with it's `wrappedValue`

```
struct Tab_1_1_View: View {
    
    // 1.
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Color(.systemRed).edgesIgnoringSafeArea(.all)
        }
        .largeNavigationBar(titleView:
                    Text("Tab_1_1_View").bold().lineLimit(1),
                leadingView:
                    Button {
                        // 2.
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Dismiss")
                    },
                trailingView:
                    EmptyView(),
                backgroundView:
                    Color(.tertiarySystemBackground).edgesIgnoringSafeArea(.top)
        )
    }
}

```

You may also disable swipe down on the `Sheet`:

```
Sheet(isPresented: $navigationForTab_1_3_View) {
    NavigationKitView {
        Tab_1_3_View().disableSwipeToDismiss()
    }
}
```

If you want to dismiss to root you want to use `@Binding`s and dismiss in order. `0.25` is the optimal delay:

```
struct Tab_1_3_View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var rootView: Bool
    @Binding var secondRootView: Bool
    @Binding var thirdRootView: Bool
    
    var body: some View {
        VStack {
            Color(.systemRed).edgesIgnoringSafeArea(.all)
        }
        .largeNavigationBar(titleView:
                    Text("Tab_1_3_View").bold().lineLimit(1),
                leadingView:
                    EmptyView(),
                trailingView:
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                            thirdRootView.dismiss()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            secondRootView.dismiss()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            rootView.dismiss()
                        }
                    } label: {
                        Text("Dismiss to Root")
                    },
                backgroundView:
                    Color(.tertiarySystemBackground).edgesIgnoringSafeArea(.top)
        )
    }
}
```

## 🪁 Demo project

For a comprehensive Demo project check out: 
<a href="https://github.com/rebeloper/NavigationKitDemo">NavigationKitDemo</a>

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


# SwiftUI Navigation Example
- This is a SwiftUI Navigation Example supporting iPadOS 15+/macOS 11+. 
- It uses only one `NavigationView()` and multiple `NavigationLink()`s without using `(value: P?)`. 
- For iOS I recommend alternative hierarchical setup, like using `TabView()` 

## macOS

<img width="1215" alt="Screenshot 2022-11-25 at 6 58 44 PM" src="https://user-images.githubusercontent.com/6022036/204064062-617a2245-8a05-42b3-8ba2-38e284f4ce9b.png">

## iPadOS

![IMG_EFB40D56081E-1](https://user-images.githubusercontent.com/6022036/204064431-06ea78cc-c965-42f2-aaa0-34579afdce25.jpeg)

# Why?

- This avoids more recent deployment targets such as iOS 16 or MacOS 13. Apple suggests using `NavigationStack()` or `NavigationSplitView()` to achieve more intricate views [in their documentation](https://developer.apple.com/documentation/swiftui/navigationview) but this may be prohibitive. 

- This project details the need for many `ToolbarItem` uses in order to display all of this correctly in the navigation bar.

- This project further illustrates the need to [have a "dummy" top-level view](https://github.com/peteallport/SwiftUI-Navigation-Example/blob/83676e8915f2246039c827254195adfd97045eb6/ContentView.swift#L62) so when initialized the MacOS navigation `toolbar()` items are displayed correctly and continue to do so for child views.

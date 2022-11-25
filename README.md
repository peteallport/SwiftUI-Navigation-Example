# SwiftUI Navigation Example
- This is a SwiftUI Navigation Example supporting iOS 15+/macOS 11+. 
- It uses only one `NavigationView()` and multiple `NavigationLink()`s without using `(value: P?)`. 

<hr>

- This avoids more recent deployment targets such as iOS 16 or MacOS 13. Apple suggests using `NavigationStack()` or `NavigationSplitView()` to achieve more intricate views [in their documentation](https://developer.apple.com/documentation/swiftui/navigationview) but this may be prohibitive. 

- This project further illustrates the need to [have a "dummy" top-level view](https://github.com/peteallport/SwiftUI-Navigation-Example/blob/3bb2955d61ff596a078de2e7a8b968ee34a8cf7e/ContentView.swift#L72) so when initialized the MacOS navigation `toolbar()` items are displayed correctly and continue to do so for child views.

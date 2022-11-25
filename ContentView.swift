//
//  ContentView.swift
//  Test-Navigation-Layout
//
//  Created by Peter C. Allport on 11/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isViewOneActive = true

    var body: some View {
        NavigationView {
            // Sidebar
            List {
                NavigationLink(destination: List {
                    Text("View One (2nd Column)")
                }
                .toolbar {
                    ToolbarItem {
                        Button {} label: {
                            Image(systemName: "plus")
                                .help("New Thing")
                        }
                    }
                },
                isActive: $isViewOneActive, label: {
                    Text("View One")
                })

                NavigationLink(destination: {
                    List {
                        Text("View Two (2nd Column)")
                    }
                    .toolbar {
                        ToolbarItem {
                            Button {} label: {
                                Image(systemName: "plus")
                                    .help("New Thing")
                            }
                        }
                    }
                }) {
                    Text("View Two")
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        toggleSidebar()
                    } label: {
                        Image(systemName: "sidebar.left")
                            .help("Toggle Sidebar")
                    }
                }
            }
            .listStyle(SidebarListStyle())

            // SwiftUI needs initial view .toolbar(s) defined within
            // NavigationView() in order to create correct layout.
            List {}
                .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
                .toolbar {
                    ToolbarItem {
                        Button {} label: {
                            Image(systemName: "plus")
                                .help("New Thing")
                        }
                    }
                }

            if isViewOneActive {
                List {
                    Text("View One (3rd Column)")
                }
                .toolbar {
                    Button {} label: {
                        Image(systemName: "pencil")
                            .help("Edit Thing")
                    }
                    .disabled(true)
                }
            } else {
                List {
                    Text("View Two (3rd Column)")
                }
                .toolbar {
                    Button {} label: {
                        Image(systemName: "pencil")
                            .help("Edit Thing")
                    }
                    .disabled(true)
                }
            }
        }
        // Change title depending on current view
        .navigationTitle(isViewOneActive ? "View One" : "View Two")
    }

    func toggleSidebar() {
        #if os(macOS)
            NSApp.keyWindow?.firstResponder?
                .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)),
                              with: nil)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

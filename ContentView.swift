//
//  ContentView.swift
//  Test-Navigation-Layout
//
//  Created by Peter C. Allport on 11/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    @State private var isActive = true
    @State private var isViewOneActive = false

    var body: some View {
        NavigationView {
            // Sidebar
            List {
                    NavigationLink(destination: List {
                        Text("View One (2nd Column)")
                    }
                    .onAppear {
                        isViewOneActive = false
                    }
                    .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
                    .toolbar {
                        ToolbarItem {
                            Button {} label: {
                                Image(systemName: "plus")
                                    .help("New Thing")
                            }
                        }
                    },
                    isActive: $isActive, label: {
                        Text("View One")
                    })

                NavigationLink(destination: {
                    List {
                        Text("View Two (2nd Column)")
                    }.onAppear {
                        isViewOneActive = true
                    }
                    .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
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
                    Button {} label: {
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
                VStack {
                    List {
                        Text("View Two (3rd Column)")
                    }
                }
                .toolbar {
                    Button {} label: {
                        Image(systemName: "pencil")
                            .help("Edit Thing")
                    }
                    .disabled(true)
                }
            } else {
                VStack {
                    List {
                        Text("View One (3rd Column)")
                    }
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
        .navigationTitle(isViewOneActive ? "View Two" : "View One")
    }

//    func makeDetailListView() -> some View {
//        if isViewOneActive {
//            return List {
//                Text("StudyViewDetails")
//                Text("StudyViewDetails")
//            }
//        } else {
//            return List {
//                Text("ThingsViewDetails")
//                Text("ThingsViewDetails")
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

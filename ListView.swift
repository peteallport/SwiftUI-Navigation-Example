//
//  ListView.swift
//  Test-Navigation-Layout
//
//  Created by Peter C. Allport on 11/25/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Text("I'm another list")
        }
        .toolbar {
            ToolbarItem {
                Button {} label: {
                    Image(systemName: "plus")
                        .help("New Thing")
                }
            }
        }

        Text("3")
            .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                Button {} label: {
                    Image(systemName: "trash")
                        .help("Delete Thing")
                }
            }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

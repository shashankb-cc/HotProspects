//
//  ContentView.swift
//  HotProspects
//
//  Created by Shashank B on 05/03/25.
//

//If you’re going to use them, use them in lots of places – it can be frustrating to press and hold on something only to find nothing happens.
//Keep your list of options as short as you can – aim for three or less.
//Don’t repeat options the user can already see elsewhere in your UI.
//Remember, context menus are by their nature hidden, so please think twice before hiding important actions in a context menu.

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red") {
                        backgroundColor = .red
                    }
                    
                    Button("Pink", systemImage: "checkmark.circle.fill",role: .destructive) {
                        backgroundColor = .pink
                    }

                    Button("Green") {
                        backgroundColor = .green
                    }

                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}
#Preview {
    ContentView()
}

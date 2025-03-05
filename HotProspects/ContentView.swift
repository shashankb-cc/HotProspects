//
//  ContentView.swift
//  HotProspects
//
//  Created by Shashank B on 05/03/25.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection: String?  //single selection
    @State private var selection = Set<String>()

    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]

    var body: some View {

        List(users, id: \.self,selection: $selection) { user in
            Text(user)
        }
        EditButton()

        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
    }
}

#Preview {
    ContentView()
}

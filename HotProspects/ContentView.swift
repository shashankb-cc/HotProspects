//
//  ContentView.swift
//  HotProspects
//
//  Created by Shashank B on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            
            //single way swipe
            Text("Humba humba")
                .swipeActions{
                    Button("Send message", systemImage: "message") {
                                   print("Hi")
                               }
                }
            
            
            //double way swipe
            Text("Kamba kamba")
                    .swipeActions {
                        Button("Delete", systemImage: "minus.circle", role: .destructive) {
                            print("Deleting")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Pin", systemImage: "pin") {
                            print("Pinning")
                        }
                        .tint(.orange)
                    }
        }
    }
}

#Preview {
    ContentView()
}

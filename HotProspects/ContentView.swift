//
//  ContentView.swift
//  HotProspects
//
//  Created by Shashank B on 05/03/25.
//

//Tip: It’s common to want to use NavigationStack and TabView at the same time, but you should be careful: TabView should be the parent view, with the tabs inside it having a NavigationStack as necessary, rather than the other way around.
//should TabView be the parent, not NavigationStack

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"

    var body: some View {
        TabView (selection:$selectedTab){
            Text("tab 1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            Text("tab 2")
                .tabItem {
                    Label("Two", systemImage: "star")
                    
                }
                .tag("Two")
        }
        
        Button("Change tabs") {
            selectedTab = selectedTab == "One" ?  "Two" :  "One"
        }
    }
}

//✅ Correct Approach: TabView as the Parent
struct CorrectApproach: View {
    var body: some View {
        TabView {
            NavigationStack {
                FirstTabView()
            }
            .tabItem {
                Label("First", systemImage: "1.circle")
            }

            NavigationStack {
                SecondTabView()
            }
            .tabItem {
                Label("Second", systemImage: "2.circle")
            }
        }
    }
}

struct FirstTabView: View {
    var body: some View {
        NavigationLink("Go to Detail", destination: Text("Detail View in First Tab"))
            .navigationTitle("First Tab")
    }
}

struct SecondTabView: View {
    var body: some View {
        NavigationLink("Go to Detail", destination: Text("Detail View in Second Tab"))
            .navigationTitle("Second Tab")
    }
}


//works cant keep track of the tabs which i have come from
struct WrongApproach: View {
    var body: some View {
        NavigationStack { // ❌ NavigationStack as parent
            TabView {
                FirstTabView()
                    .tabItem {
                        Label("First", systemImage: "1.circle")
                    }
                
                SecondTabView()
                    .tabItem {
                        Label("Second", systemImage: "2.circle")
                    }
            }
        }
    }
}


#Preview {
    CorrectApproach()
}

#Preview {
    WrongApproach()
}

#Preview {
    ContentView()
}

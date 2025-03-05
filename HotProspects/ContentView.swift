//
//  ContentView.swift
//  HotProspects
//
//  Created by Shashank B on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""

    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }

    func fetchReadings() async {
       let fetchTask = Task {
           let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
           let (data, _) = try await URLSession.shared.data(from: url)
           let posts = try JSONDecoder().decode([Post].self, from: data)
           
                      // Extracting only the post IDs to simulate "readings"
           let ids = posts.map { $0.id }
            return "Found \(ids.count) readings"
        }
        
        let result = await fetchTask.result
//        do {
//            output = try result.get()
//        }catch {
//            output = "Error:\(error.localizedDescription)"
//        }
        
        //or alternatively
        switch result {
        case .success(let str):
                output = str
            case .failure(let error):
                output = "Error: \(error.localizedDescription)"
        }
    }
}

// Struct to match JSON data
struct Post: Codable {
    let id: Int
}

#Preview {
    ContentView()
}

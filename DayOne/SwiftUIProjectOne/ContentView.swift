//
//  ContentView.swift
//  SwiftUIProjectOne
//
//  Created by Rohit Sharma on 29/01/23.
//

import SwiftUI

/*
var body: some View {
    NavigationStack {
        NavigationLink {
            Text("destination")
        } label: {
            Text("Tap Me")
        }
        Form {
            Section {
                Text("hello world!")
                Text("hello world!")
                Text("hello world!")
            }
        }
    }.navigationBarTitleDisplayMode(.inline)
    
}
*/

// State helps in modifying in the struct...
struct ContentView: View {
    @State private var tapCount = 0
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
        }
    }
    
    mutating func incrementCount() {
        tapCount += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

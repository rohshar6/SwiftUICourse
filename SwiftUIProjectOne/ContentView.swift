//
//  ContentView.swift
//  SwiftUIProjectOne
//
//  Created by Rohit Sharma on 29/01/23.
//

import SwiftUI

struct ContentView: View {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

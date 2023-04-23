//
//  ContentView.swift
//  Day29
//
//  Created by Rohit Sharma on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var words = [String]()
    var body: some View {
        List($words, id: \.self) {_ in
            Section("1") {
                Text("Static row 1")
            }
            
            
            Section("2") {
                ForEach(0..<5) { num in
                    Text("Dynamic row: \(num)")
                }
            }
            
            Section("3") {
                Text("")
            }
        }.listStyle(.grouped)
    }
    
    func loadFile() {
        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileUrl) {
                let words = fileContents.components(separatedBy: "\n")
                let randomWords = words.randomElement()
                let trimmed = randomWords?.trimmingCharacters(in: .whitespacesAndNewlines)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

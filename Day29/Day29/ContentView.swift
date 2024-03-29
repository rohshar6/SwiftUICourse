//
//  ContentView.swift
//  Day29
//
//  Created by Rohit Sharma on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var words: [String] = []
    @State var rootWord = ""
    @State var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        TextField("Enter your Word", text: $newWord)
                            .textInputAutocapitalization(.never)
                    }
                    
                    Section {
                        ForEach(words, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                            
                        }
                    }
                }
                .navigationTitle(rootWord)
                .onSubmit {
                    addNewWord()
                }
                .onAppear(perform: loadFile)
                .alert(errorTitle, isPresented: $showingError) {
                    Button("ok", role: .cancel) {
                        
                    }
                } message: {
                    Text(errorMessage)
                }
                .toolbar {
                    Button("restart") {
                        updateRootWord()
                    }
                }
                
                Text("Score: \(score)")
            }
        }
    }
    
    func updateRootWord() {
        loadFile()
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespaces)
        
        guard !answer.isEmpty else { return }
        
//        guard isOriginal(word: answer) else {
//            wordError(title: "Word used already", message: "Be more original!")
//            return
//        }
//
//        guard isPossible(word: answer) else {
//            wordError(title: "Word not possible", message: "You can't spell this word")
//            return
//        }
//
//        guard isReal(word: answer) else {
//            wordError(title: "word not recongized", message: "you can't just make up words, you know")
//            return
//        }
        
        withAnimation(.linear(duration: 15)) {
            words.insert(answer, at: 0)
        }
        withAnimation(Animation.linear.repeatCount(2)) {
            words.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func loadFile() {
        if let fileUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileUrl) {
                let words = fileContents.components(separatedBy: "\n")
                rootWord = words.randomElement() ?? "silkworm"
//                let trimmed = randomWords?.trimmingCharacters(in: .whitespacesAndNewlines)
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle")
    }
    
    
    func isOriginal(word: String) -> Bool {
        !words.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledWord = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledWord.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func isAllowed(word: String) -> Bool {
        guard word.count > 3 && !word.elementsEqual(rootWord) else { return false }
        return true
    }
}

struct ContentView2: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation(.linear(duration: 1).delay(5)) {
                    showDetails.toggle()
                }
            }

            if showDetails {
                Text("Details go here.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  BoltPractice.swift
//  M1BroadcasterBooth
//
//  Created by Joe Morgan on 2022-12-23.
//


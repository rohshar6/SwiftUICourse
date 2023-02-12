//
//  ContentView.swift
//  Day21
//
//  Created by Rohit Sharma on 12/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["estonia", "france", "germany", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack (spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is : \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1;
        } else {
            scoreTitle = "wrong"
            score -= 1;
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

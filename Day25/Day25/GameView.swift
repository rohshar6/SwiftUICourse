//
//  GameView.swift
//  Day25
//
//  Created by Rohit Sharma on 19/02/23.
//

import SwiftUI

struct GameView: View {
    @State private var object = ["paper", "rock", "scissors"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var presentAlert = true
    @State private var shouldWin = Bool.random()
    @State private var score: Int = 0
    @State private var answered = 0
    @State private var userAnswer: Int? {
        didSet {
            updateScore()
        }
    }
    
    func updateScore() {
        answered += 1
        if shouldWin {
            if userAnswer == correctAnswer {
                score += 1
            }
        } else {
            if userAnswer != correctAnswer {
                score += 1
            }
        }
        correctAnswer = Int.random(in: 0...2)
        shouldWin.toggle()
        
        if answered == 10 {
            score = 0
            answered = 0
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Text("App Selected Option")
                    .font(.system(.largeTitle))
                    .bold()
                
                Button {
                    
                } label: {
                    if let img = UIImage(named: object[correctAnswer]) {
                        Image(uiImage: img)
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                    } else {
                        Text("Rock")
                    }
                }
                
                
                Text("Please Select An Option: ")
                    .font(.system(.title2))
                    .bold()
                    .padding()
                
                VStack {
                    HStack {
                        Button {
                            userAnswer  = 0
                        } label: {
                            Image(uiImage: UIImage(imageLiteralResourceName: "paper"))
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                        }
                        Button {
                            userAnswer = 1
                        } label: {
                            if let img = UIImage(named: "rock") {
                                Image(uiImage: img)
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                Text("Rock")
                            }
                            
                        }
                        Button {
                            userAnswer = 2
                        } label: {
                            Image(uiImage: UIImage(imageLiteralResourceName: "scissors"))
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                        }
                    }.padding()
                    
                    Text("Score: \(score)")
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

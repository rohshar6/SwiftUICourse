//
//  ContentView.swift
//  AnimationsDay32
//
//  Created by Rohit Sharma on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var animationAmount = 1.0
    
    
    var body: some View {
        Button("tap me") {
        } .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(content: {
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                               , value: animationAmount)
            })
            .onAppear {
                animationAmount = 2
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

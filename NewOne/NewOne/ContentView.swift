//
//  ContentView.swift
//  NewOne
//
//  Created by Rohit Sharma on 20/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }

    
    var body: some View {
       Circle()
            .frame(width: 100)
            .foregroundColor(.red)
            .position(location)
            .gesture(drag)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

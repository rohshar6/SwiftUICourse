//
//  ContentView.swift
//  Day26
//
//  Created by Rohit Sharma on 04/03/23.
//

import SwiftUI

// PART - 1
/*
 VStack(alignment: .leading, spacing: 10) {
     Stepper(value: $count, in: 4...12, step: 0.25) {
         Text("count: \(count.formatted())")
     }
 }.padding()
 */

struct ContentView: View {
    @State var count = 5.0
    @State var date = Date.now
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            DatePicker("Select a date: ", selection: $date, displayedComponents: .date).labelsHidden()
        }.padding()
        
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Day27
//
//  Created by Rohit Sharma on 04/03/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var coffeeCups = [1,2,3,4,5,6,7,8,9,10]
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please Select Wake Up Time: ", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
                    
                    Text("Desired Amount of sleep")
                        .font(.headline)
                    Stepper("Sleep Amount : \(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                    Text("Daily Coffee intake")
                        .font(.headline)
                    Picker("Coffee Amount", selection: $coffeeAmount) {
                        ForEach($coffeeCups, id: \.self) {val in
                            let txt = """
                            \(val.wrappedValue)
                          """
                            Text(txt)
                        }
                    }
                }, header: {
                    Text("")
                })
            }
           
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
            .padding()
            .navigationTitle("Better Rest")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                Button("Calculate") {
                    calculateBedTime()
                }
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            NSLog("error", "")
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 */

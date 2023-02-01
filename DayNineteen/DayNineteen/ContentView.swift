//
//  ContentView.swift
//  DayNineteen
//
//  Created by Rohit Sharma on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    private let tempState: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    private let convertState: [String] = ["Temperature", "Length", "Time", "Volume"]
    @State private var currentSelectedState = "Temperature"
    
    @State private var tempInputValue = 0.0
    @State private var currentType = "Celsius"
    @State private var toNewType = "Kelvin"
    private var tempOutputValue: Double {
        return convertTemp()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(currentSelectedState, selection: $currentSelectedState) {
                        ForEach(convertState, id: \.self) { val in
                            Text(val)
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section {
                    TextField("Input Temperature Value", value: $tempInputValue, format: .number)
                } header: {
                    Text("Add Temperature")
                }
                
                Section {
                    Picker(currentType, selection: $currentType) {
                        ForEach(tempState, id: \.self) { val in
                            Text(val)
                        }
                    }
                } header: {
                    Text("Current Type")
                }
                
                Section {
                    Picker(toNewType, selection: $toNewType) {
                        ForEach(tempState, id: \.self) { val in
                            Text(val)
                        }
                    }
                } header: {
                    Text("New Type")
                }
                
                Section {
                    Text(tempOutputValue, format: .number)
                } header: {
                    Text("Result Temperature")
                }
            }
        }
    }
    
    private func convertTemp() -> Double {
        var val = 0.0
        if currentType == "Celsius" {
            if toNewType == "Kelvin" {
                return tempInputValue - 273.15
            }
            if toNewType == "Fahrenheit" {
                val = (tempInputValue * 1.8 + 32)
                return val
            }
            return tempInputValue
        }
        
        if currentType == "Kelvin" {
            if toNewType == "Celsius" {
                return tempInputValue + 273.15
            }
            if toNewType == "Fahrenheit" {
                let tempInCelsius = tempInputValue + 273.15
                val = (tempInCelsius * 1.8 + 32)
                return val
            }
            return tempInputValue
        }
        
        return val
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

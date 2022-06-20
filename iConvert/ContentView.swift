//
//  ContentView.swift
//  iConvert
//
//  Created by Hugo Silva on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Fahrenheit"
    @State private var temperature: Double = 0
    let TempUnit = ["Celsius", "Fahrenheit", "Kelvin"]
    var outputTemp: Double {
        if inputUnit == "Celsius" {
            if outputUnit == "Fahrenheit" {
                return temperature * 9 / 5 + 32
            } else if outputUnit == "Kelvin" {
                return temperature + 273.15
            } else {
                return temperature
            }
        } else if inputUnit == "Fahrenheit" {
            if outputUnit == "Celsius" {
                return (temperature - 32)*5/9
            } else if outputUnit == "Kelvin" {
                return (temperature - 32)*5/9+273.15
            } else {
                return temperature
            }
        } else {
            if outputUnit == "Celsius" {
                return temperature-273.15
            } else if outputUnit == "Fahrenheit" {
                return (temperature - 273.15) * 9/5 + 32
            } else {
                return temperature
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(TempUnit, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Input unit")
                }
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(TempUnit, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Output unit")
                }
                Section {
                    TextField("Temperature to convert", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Temperature to convert")
                }
                Section {
                    Text(outputTemp, format: .number)
                } header: {
                    Text("Converted temperature")
                }
            }
            .navigationTitle("iConvert")
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

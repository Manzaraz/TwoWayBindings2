//
//  ContentView.swift
//  TwoWayBindings2
//
//  Created by Christian Manzaraz on 24/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCounter = 0
    @State private var toggleIsOn = false
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate = Date()
    @State private var stepperValue = 1
    
    var body: some View {
        VStack {
            Group {
                Text("Press Count: \(pressCounter)")
                
                Button("Press Me") {
                    pressCounter += 1
                }
                .buttonStyle(.borderedProminent)
                
                TextField("Enter a name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.words)
                Text("Name entered: \(name)")
                
                Spacer()
                
                Toggle("Toggle is \(toggleIsOn ? "On" : "Off" ):", isOn: $toggleIsOn)

                Spacer()
            }
                        
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
            ColorPicker("Pick a rectangle Color", selection: $selectedColor)
            
            Spacer()
            
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is: \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
                .font(.callout)
            
            Spacer()
            
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in: 1...10)
            
            Spacer()
        }
        .font(.title2)
        .padding()

    }
}

#Preview {
    ContentView()
}

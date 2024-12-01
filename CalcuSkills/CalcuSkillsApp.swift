//
//  CalcuSkillsApp.swift
//  CalcuSkills
//
//  Created by Johannes on 21.11.24.
//

import SwiftUI

@main
struct EinmaleinsApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Willkommen zur Dreimaleins-App ")
                    .font(.title)
                    .padding()

                NavigationLink(destination: MultiplicationView()) {
                    Text("Start")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Startseite")
        }
    }
}

struct MultiplicationView: View {
    @State private var selectedNumber: Int = 1

    var body: some View {
        VStack {
            Text("Einmaleins für \(selectedNumber)")
                .font(.title)
                .padding()

            Picker("Wähle eine Zahl", selection: $selectedNumber) {
                ForEach(1...10, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()

            List(1...10, id: \.self) { multiplier in
                Text("\(selectedNumber) × \(multiplier) = \(selectedNumber * multiplier)")
            }
        }
        .padding()
        .navigationTitle("Einmaleins")
    }
}


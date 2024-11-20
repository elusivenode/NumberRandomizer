//
//  ContentView.swift
//  NumberRandomizer
//
//  Created by Hamish MacDonald on 20/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNum: Int?
    @State private var maxValue = ""
    @State private var generatedNumbers: String = ""

    var body: some View {
        VStack {
            Text("Enter a maximum value (10 to 1,000,000):")
                .font(.system(size: 20))
                .padding()
            TextField("Max Value", text: $maxValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .padding()

            Text(randomNum != nil ? "\(randomNum!)" : "?")
                .font(.system(size: 30))
                .padding()
            Button {
                if let value = Int(maxValue) {
                    randomNum = Int.random(in: 1...value)
                    let generatedNumber = randomNum!
                    if generatedNumbers.isEmpty {
                        generatedNumbers = "\(generatedNumber)"
                    } else {
                        generatedNumbers += ", \(generatedNumber)"
                    }
                }
            } label: {
                Text("Generate Random Number")
                    .font(.system(size: 20))
                    .padding()
            }

            if !generatedNumbers.isEmpty {
                Text("Generated Numbers:")
                    .font(.system(size: 20))
                    .padding()

                ScrollView {
                    Text(generatedNumbers)
                        .font(.system(size: 16))
                        .padding()
                }
                .frame(height: 100)
            }
        }
        .frame(minWidth: 400, minHeight: 600) // Set minimum window size
        .padding(30)
    }
}

#Preview {
    ContentView()
}

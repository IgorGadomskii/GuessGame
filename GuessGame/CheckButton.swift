//
//  CheckButton.swift
//  GuessGame
//
//  Created by Macbook on 15.05.2022.
//

import SwiftUI

struct CheckButton: View {
    
    @State private var isPresented = false
    @Binding var sliderValue: Float
  
    var newNumber: Int
    
    
    var body: some View {
        Button("Check me!") {
            isPresented = true
        }
        .padding()
        .alert("Your score is ", isPresented: $isPresented, actions: {}) {
            Text("\(computeScore())%")
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(newNumber - lround(Double(sliderValue) * 100))
        return 100 - difference
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(sliderValue: .constant(50), newNumber: 100)
    }
}

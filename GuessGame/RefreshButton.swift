//
//  RefreshButton.swift
//  GuessGame
//
//  Created by Macbook on 15.05.2022.
//

import SwiftUI

struct RefreshButton: View {
    @Binding var newNumber: Int
    
    var body: some View {
        Button("Try again")
        {
            newNumber = Int.random(in: (0...100))
        }
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton(newNumber: .constant(50))
    }
}

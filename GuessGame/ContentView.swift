

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Float(0.5)
    @State private var newNumber = Int.random(in: (0...100))
   
    
    var body: some View {
        VStack{
            HStack{
                Text("Подвинь слайдер как можно ближе к: ")
                Text("\(newNumber)")
            }
            HStack{
                Text("0")
                SliderView(
                    newValue: $sliderValue,
                    alpha: computeScore(),
                    color: .systemGray3
                )
                Text("100")
            }
            CheckButton(sliderValue: $sliderValue, newNumber: newNumber)
            RefreshButton(newNumber: $newNumber)
            
        }
        .padding()
    
    }
    
   private func computeScore() -> Int {
        let difference = abs(newNumber - lround(Double(sliderValue) * 100))
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

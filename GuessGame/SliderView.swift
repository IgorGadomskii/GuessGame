//
//  SliderView.swift
//  GuessGame
//
//  Created by Macbook on 13.05.2022.
//

import SwiftUI

struct SliderView : UIViewRepresentable {
    
    @Binding var newValue: Float
    let alpha: Int
    let color: UIColor

    func makeUIView(context: Context) -> UISlider {
        let sliderView = UISlider()
        
        
        sliderView.addTarget(
            context.coordinator,
            action: #selector(Coordinator.getNewValue(_:)),
            for: .valueChanged
        )
        
        return sliderView
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = newValue
    }
    

    func makeCoordinator() -> Coordinator {
        Coordinator(newValue: $newValue)
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var newValue: Float
        
        init(newValue: Binding<Float>) {
            self._newValue = newValue
        }
        
        @objc func getNewValue(_ sender: UISlider) {
            newValue = sender.value
        }
    }
}

//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jamie Carruthers on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    var body: some View {
        let statDisplay = starterCars.cars[selectedCar].displayStats()
        VStack(alignment: .leading, spacing: 20) {
            Text("""
            \(statDisplay.0)
            \(statDisplay.1)
            \(statDisplay.2)
            \(statDisplay.3)
            \(statDisplay.4)
            """)
            Button("Random Car", action: {
                selectedCar = Int.random(in: 0 ..< starterCars.cars.count)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jamie Carruthers on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    let starterCar = StarterCars()
    var selectedCar: Int = 0
    
    var body: some View {
        let statDisplay = StarterCars.cars[selectedCar].displayStats()
        Text("""
            \(statDisplay.0)
            \(statDisplay.1)
            \(statDisplay.2)
            \(statDisplay.3)
            \(statDisplay.4)
        """)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

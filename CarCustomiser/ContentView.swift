//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jamie Carruthers on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "BMW", model: "X3", topSpeed: 130, acceleration: 8.4, handling: 7)
    
    var body: some View {
        let statDisplay = car.displayStats()
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

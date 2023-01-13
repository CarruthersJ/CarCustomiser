//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Jamie Carruthers on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage: Bool = false
    @State private var tiresPackage: Bool = false
    @State private var wheelsPackage: Bool = false
    @State private var superPackage: Bool = false
    
    var body: some View {
        let statDisplay = starterCars.cars[selectedCar].displayStats()
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 10
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 10
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let wheelsPackageBinding = Binding<Bool> (
            get: { self.wheelsPackage },
            set: { newValue in
                self.wheelsPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.5
                }
            }
        )
        
        let superPackageBinding = Binding<Bool> (
            get: { self.superPackage },
            set: { newValue in
                self.superPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].acceleration -= 0.25
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].acceleration += 0.25
                }
            })
        
        Form {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("""
                \(statDisplay.0)
                \(statDisplay.1)
                \(statDisplay.2)
                \(statDisplay.3)
                \(statDisplay.4)
                """)
                Button("Next Car", action: {
                    exhaustPackage = false
                    tiresPackage = false
                    wheelsPackage = false
                    superPackage = false
                    selectedCar += 1
                })
            }
            
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Grip Package", isOn: tiresPackageBinding)
                Toggle("Speedy wheels", isOn: wheelsPackageBinding)
                Toggle("Upgrade all stats", isOn: superPackageBinding)
            }
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

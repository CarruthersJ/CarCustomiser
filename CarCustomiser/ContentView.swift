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
    
    func resetToggles() {
        if exhaustPackage == true {
            starterCars.cars[selectedCar].topSpeed -= 10
        }
        exhaustPackage = false
        if tiresPackage == true {
            starterCars.cars[selectedCar].handling -= 2
        }
        tiresPackage = false
        if wheelsPackage == true {
            starterCars.cars[selectedCar].acceleration += 0.5
        }
        wheelsPackage = false
        if superPackage == true {
            starterCars.cars[selectedCar].topSpeed -= 5
            starterCars.cars[selectedCar].handling -= 1
            starterCars.cars[selectedCar].acceleration += 0.25
        }
        superPackage = false
        remainingFunds = 1000
    }
    
    @State private var exhaustPackage: Bool = false
    @State private var tiresPackage: Bool = false
    @State private var wheelsPackage: Bool = false
    @State private var superPackage: Bool = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else if remainingFunds == 0 && exhaustPackage == false {
            return false
        } else {
            return true
        }
    }
    
    var tiresPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else if remainingFunds == 0 && tiresPackage == false {
            return false
        } else {
            return true
        }
    }
        
    var wheelsPackageEnabled: Bool {
        if remainingFunds >= 500 {
            return true
        } else if remainingFunds == 0 && wheelsPackage == false {
            return false
        } else {
            return true
        }
    }
    
    var superPackageEnabled: Bool {
        if remainingFunds >= 1000 {
            return true
        } else if remainingFunds == 500 && superPackage == false {
            return false
        } else {
            return true
        }
    }
    
    var body: some View {
        let statDisplay = starterCars.cars[selectedCar].displayStats()
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 10
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 10
                    remainingFunds += 500
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let wheelsPackageBinding = Binding<Bool> (
            get: { self.wheelsPackage },
            set: { newValue in
                self.wheelsPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 0.5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 0.5
                    remainingFunds += 500
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
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].acceleration += 0.25
                    remainingFunds += 1000
                }
            })
        VStack {
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
                        resetToggles()
                        selectedCar += 1
                    })
                }
                
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Grip Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Speedy wheels (Cost: 500)", isOn: wheelsPackageBinding)
                        .disabled(!wheelsPackageEnabled)
                    Toggle("Upgrade all stats (Cost: 1000)", isOn: superPackageBinding)
                        .disabled(!superPackageEnabled)
                }
            }
            Text("Remaining funds: \(remainingFunds)")
                .foregroundColor(.green)
                .baselineOffset(25)
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

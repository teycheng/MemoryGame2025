//
//  SettingsView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//
import SwiftUI

struct SettingsView: View {
    @Binding var stepperVal : Int
    @Binding var treasureVal : Int
    @State private var show = true
    @Binding var count: Int
    @Binding var name : String
    @Binding var showGame : Bool
    @Binding var showSetting : Bool
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ImagePickerView(count: $count, name:$name)
                Stepper(
                    value: Binding(get: {stepperVal},
                                   set:{newValue in
                                       stepperVal = newValue
                                       UserDefaults.standard.set(stepperVal, forKey: "StepperValue")
                                       })
                    , in: 2...10, label: { Text("\(stepperVal) Rows/Columns")})
                    .accessibilityIdentifier("RowColumnStepper")

                Stepper(
                    value: Binding(get: {treasureVal},
                                   set:{newValue in
                                       treasureVal = newValue
                                       UserDefaults.standard.set(stepperVal, forKey: "TreasureValue")
                                       })
                    , in: 2...10, label: { Text("\(treasureVal) Treasure")})
                .accessibilityIdentifier("TreasureButton")

                    Toggle("Bonus Tile", isOn: $show)
                    .accessibilityIdentifier("BonusTileToggle")
                
            }
        }
    }
    
    
    //#Preview {
    //    SettingsView()
    //}
}

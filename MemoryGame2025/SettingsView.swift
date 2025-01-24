//
//  SettingsView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//
import SwiftUI

struct SettingsView: View {
    @State private var stepperVal = UserDefaults.standard.value(forKey:
    "StepperValue") as? Int ?? 2
    @State private var treasureVal = UserDefaults.standard.value(forKey:
    "TreasureValue") as? Int ?? 2
    @State private var show = true
    @Binding var name : String
    @Binding var showGame : Bool
    @Binding var showSetting : Bool
    var body: some View {
        NavigationStack {
            VStack {
                ImagePickerView(name:$name)
                Stepper(
                    value: Binding(get: {stepperVal},
                                   set:{newValue in
                                       stepperVal = newValue
                                       UserDefaults.standard.set(stepperVal, forKey: "SliderValue")
                                       })
                    , in: 2...10, label: { Text("\(stepperVal) Rows/Columns")})
                Stepper(
                    value: Binding(get: {treasureVal},
                                   set:{newValue in
                                       treasureVal = newValue
                                       UserDefaults.standard.set(stepperVal, forKey: "TreasureValue")
                                       })
                    , in: 2...10, label: { Text("\(treasureVal) Treasure")})
                    Toggle("Bonus Tile", isOn: $show)

            }
        }
    }
    
    
    //#Preview {
    //    SettingsView()
    //}
}

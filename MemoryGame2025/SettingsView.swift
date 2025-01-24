//
//  SettingsView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//
import SwiftUI

struct SettingsView: View {
    @State private var stepperVal = 2
    @State private var treasureVal = 2
    @State private var show = true
    @Binding var name : String
    @State private var showGame = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if !showGame {
                    ImagePickerView(name:$name)

                    Stepper("\(stepperVal) Rows/Columns", value: $stepperVal, in: 2...10)
                    Stepper("\(treasureVal) Treasure", value: $treasureVal, in: 2...10)
                    Toggle("Bonus Tile", isOn: $show)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    showGame = true
                                }, label: {
                                    Image(systemName: "house")
                                })
                            }
                        }
                }
                else if showGame {
                    GameView(name: $name)
                }
                
                
            }
        }
    }
    
    
    //#Preview {
    //    SettingsView()
    //}
}

//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-10.
//

import SwiftUI

struct ContentView: View {
    @State var name : String
    @State var count : Int
    @State var showSetting = false
    @State var showGame = true
    @State var stepperVal = UserDefaults.standard.value(forKey:
    "StepperValue") as? Int ?? 2
    @State var treasureVal = UserDefaults.standard.value(forKey:
    "TreasureValue") as? Int ?? 2
    
    init() {
        _name = State(initialValue: UserDefaults.standard.value(forKey:"name") as? String ?? "sun.max")
        _count = State(initialValue: UserDefaults.standard.value(forKey:"count") as? Int ?? 0)
    }
    var body: some View {
        NavigationStack{
            VStack{
                if showSetting {
                    SettingsView(stepperVal: $stepperVal, treasureVal: $treasureVal, count: $count, name: $name, showGame: $showGame, showSetting: $showSetting)
                        .padding()
                }
                if showGame{
                    GameView(name: $name, showSetting: $showSetting, showGame: $showGame,count: $count, stepperVal: $stepperVal,treasureVal: $treasureVal)
                        .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if showGame {
                            showGame = false
                            showSetting = true
                        } else {
                            showGame = true
                            showSetting = false
                        }
                    }, label: {
                        Image(systemName: showGame ? "gear" : "house")
                    })
                    .accessibilityIdentifier(showGame ? "SettingsButton" : "GameButton")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

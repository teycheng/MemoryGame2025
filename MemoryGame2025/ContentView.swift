//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var name = UserDefaults.standard.value(forKey:"name") as? String ?? "sun.max"
    @State var showSetting = false
    @State var showGame = true
    
    var body: some View {
        NavigationStack{
            VStack{
                if showSetting {
                    SettingsView(name: $name, showGame: $showGame, showSetting: $showSetting)
                        .padding()
                }
                if showGame{
                    GameView(name: $name, showSetting: $showSetting, showGame: $showGame)
                        .padding()
                }
            }
            .toolbar {
                if showGame {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showGame = false
                            showSetting = true
                        }, label: {
                            Image(systemName: "gear")
                        })
                    }
                }
                else if !showGame {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showGame = true
                            showSetting = false
                        }, label: {
                            Image(systemName: "house")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  GameView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//

import SwiftUI

struct GameView: View {
    @Binding var name: String
    @State var showSetting = false
    var body: some View {
        NavigationStack {
            VStack {
                if !showSetting {
                    Image(systemName: name)
                        .resizable()
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                } else {
                    SettingsView(name:$name)
                }
            }
            .toolbar {
                if !showSetting {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            showSetting = true
                        }, label: {
                            Image(systemName: "gear")
                        })
                    }
                }
            }
            
        }}
}
//
//#Preview {
//    GameView()
//}

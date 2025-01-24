//
//  GameView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//

import SwiftUI

struct GameView: View {
    @Binding var name: String
    @Binding var showSetting: Bool
    @Binding var showGame: Bool
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: name)
                    .resizable()
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }}
}
//
//#Preview {
//    GameView()
//}

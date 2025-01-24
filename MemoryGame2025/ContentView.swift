//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var name = UserDefaults.standard.value(forKey:"name") as? String ?? "sun.max"
    
    var body: some View {
        SettingsView(name: $name)
        .padding()
    }
}

#Preview {
    ContentView()
}

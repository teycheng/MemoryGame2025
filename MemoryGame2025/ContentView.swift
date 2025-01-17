//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-10.
//

import SwiftUI

struct ContentView: View {
    @State private var stepperVal = 2
    @State private var treasureVal = 2
    @State private var show = true
    var body: some View {
        VStack{
            ImagePickerView()
            Stepper("\(stepperVal) Rows/Columns", value: $stepperVal, in: 2...10)
            Stepper("\(treasureVal) Treasure", value: $treasureVal, in: 2...10)
            Toggle("Bonus Tile", isOn: $show)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

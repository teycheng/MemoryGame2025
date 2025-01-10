//
//  ContentView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-10.
//

import SwiftUI

struct ContentView: View {
   @State private var showSun = false
   @State private var showBird = true
   @State private var showFish = false
  @State private var count = 0
   @State private var images = ["cloud.sun.rain", "bird","fish"];
    var body: some View {
        HStack {
            Image(systemName: "arrowtriangle.left")
               .imageScale(.large)
               .foregroundStyle(.tint)
               .onTapGesture() {
                   count -= 1
                   if (count<0) {
                       count = 2
                   }
               }
                VStack {
                    Image(systemName: images[count])
                        .resizable()
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .aspectRatio(contentMode: ContentMode.fit)
                    Text(images[count])
                }
                Image(systemName: "arrowtriangle.right")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .onTapGesture {
                        count += 1
                        if (count>2) {
                            count = 0
                        }
                    }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ImagePickerView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var images = ["cloud.sun.rain", "bird","fish"];
    @Binding  var count : Int
    @Binding var name: String
    @State var counter: Int = 0

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
                   updateName()
                   counter += 1
               }
               .accessibilityIdentifier("PreviousButton")
                Text("\(name)")
                
                VStack {
                    Image(systemName: name)
                        .resizable()
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .aspectRatio(contentMode: ContentMode.fit)
                        .accessibilityLabel("\(name)")
                        .accessibilityIdentifier("SelectedImage")
                        Text("\(count)")
                        Text("\(name)")
                }
            
                Image(systemName: "arrowtriangle.right")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .onTapGesture {
                        count += 1
                        if (count>2) {
                            count = 0
                        }
                        updateName()
                    }
                    .accessibilityIdentifier("NextButton")

        }
    }
    private func updateName() {
            name = images[count]
            UserDefaults.standard.set(name, forKey: "name")
            UserDefaults.standard.set(count, forKey: "count")
        }
}

//#Preview {
//    ImagePickerView()
//}

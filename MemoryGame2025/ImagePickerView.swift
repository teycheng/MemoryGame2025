//
//  ImagePickerView.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-01-17.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var images = ["cloud.sun.rain", "bird","fish"];
    @State private var count = 0

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
    }
}

//#Preview {
//    ImagePickerView()
//}

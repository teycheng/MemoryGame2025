//
//  Tile.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-02-06.
//
import Observation
@Observable class Tile : Identifiable {
    var contents : String?
    
    init(contents: String?) {
        self.contents = contents
    }
}

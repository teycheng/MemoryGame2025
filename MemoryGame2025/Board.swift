//
//  Board.swift
//  MemoryGame2025
//
//  Created by ICS 224 on 2025-02-07.
//
import Observation
@Observable class Board {
    var stepperVal: Int = 2
    var board : [[Tile]] = [[Tile]]()
    init(stepperVal : Int){
        for _ in 1...stepperVal {
            var tileRow = [Tile]()
            for _ in 1...stepperVal {
                tileRow.append(Tile(contents: nil))
            }
            board.append(tileRow)
        }
    }
}


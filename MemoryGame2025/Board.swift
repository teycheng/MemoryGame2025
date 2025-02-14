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
    var name: String = "bird"
    var remainingTreasure : Int = 2
    init(stepperVal : Int, remainingTreasure:Int, name: String){
        self.stepperVal = stepperVal
        self.name = name
        self.remainingTreasure = remainingTreasure
        self.board = []
        
        for _ in 1...stepperVal {
            var tileRow = [Tile]()
            for _ in 1...stepperVal {
                tileRow.append(Tile(contents: nil))
            }
            board.append(tileRow)
        }
        var emptyTile = stepperVal*stepperVal
        while(self.remainingTreasure>0){
            let randomRow = Int.random(in: 0..<stepperVal)
            let randomCol = Int.random(in: 0..<stepperVal)
            if (board[randomRow][randomCol].contents == nil){
                board[randomRow][randomCol].contents = name
                self.remainingTreasure -= 1
                emptyTile -= 1
            }
            if(self.remainingTreasure>0 && emptyTile == 0){
                self.remainingTreasure = 0
                break
            }
        }
    }
}


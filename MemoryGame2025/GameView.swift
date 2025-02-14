import SwiftUI

struct GameView: View {
    @Binding var name: String
    @Binding var showSetting: Bool
    @Binding var showGame: Bool
    @Binding var count: Int
    @Binding var stepperVal: Int
    @Binding var treasureVal: Int
    
    @State private var b: Board? = nil
    @State var timer = Timer.publish(every: 2, on: .main,
                                     in: .common).autoconnect()
    @State private var tapCount: Int = 0
    @State private var hiddenTreasures: Int = 0
    
//    init(treasureVal : Int){
//        self.hiddenTreasures = treasureVal
//    }
//    
    var body: some View {
        NavigationStack {
            VStack {
                if let board = b {
                    ForEach(board.board, id: \.first!.id) { row in
                        HStack {
                            ForEach(row) { tile in
                                if(tile.showTreasure){
                                    if let content = tile.contents {
                                        Image(systemName: content)
                                            .resizable()
                                            //.imageScale(.medium)
                                            .foregroundStyle(.tint)
                                            .aspectRatio(contentMode: .fit)
                                            //.padding()
                                            .accessibilityLabel("\(name)")
                                            .accessibilityIdentifier("CurrentImage")
                                    } else {
                                        Image(systemName: "circle.dashed")
                                            .resizable()
                                            //.imageScale(.medium)
                                            .foregroundStyle(.tint)
                                            .aspectRatio(contentMode: .fit)
                                            //.padding()
                                            .accessibilityLabel("\(name)")
                                            .accessibilityIdentifier("CurrentImage")
                                    }
                                } else {
                                    Image(systemName: "questionmark.circle.dashed")
                                        .resizable()
                                        //.imageScale(.medium)
                                        .foregroundStyle(.tint)
                                        .aspectRatio(contentMode: .fit)
                                        //.padding()
                                        .accessibilityLabel("\(name)")
                                        .accessibilityIdentifier("CurrentImage")
                                        .onTapGesture {
                                            if tile.contents == nil {
                                                tile.contents = nil
                                            } else {
                                                tile.contents = name
                                                tile.showTreasure = true
                                                hiddenTreasures -= 1
                                                
                                            }
                                             tapCount += 1
                                        }
                                }
                            }
                        }
                        
                        }
 
                    }
                }
                Text("Unrevealed Treasures: \(hiddenTreasures)")
                Text("Tap Count: \(tapCount)")
            }
            .onAppear {
                b = Board(stepperVal: stepperVal, remainingTreasure: treasureVal , name: name)
                hiddenTreasures = treasureVal

            }
            .onReceive(timer) { _ in
                for row in b!.board {
                    for tile in row {
                        tile.showTreasure = false
                    }
                }
                timer.upstream.connect().cancel()
            }
        }
    }
}

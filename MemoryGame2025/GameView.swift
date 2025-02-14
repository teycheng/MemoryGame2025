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
    @State var showTreasure: Bool = true
    @State private var tapCount: Int = 0
    @State private var unrevealedTreasures: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                if let board = b {
                    ForEach(board.board, id: \.first!.id) { row in
                        HStack {
                            ForEach(row) { tile in
                                if(showTreasure){
                                    if let content = tile.contents {
                                        Image(systemName: content)
                                            .resizable()
                                            .imageScale(.large)
                                            .foregroundStyle(.tint)
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .accessibilityLabel("\(name)")
                                            .accessibilityIdentifier("CurrentImage")
                                    } else {
                                        Image(systemName: "questionmark.circle.dashed")
                                            .resizable()
                                            .imageScale(.large)
                                            .foregroundStyle(.tint)
                                            .aspectRatio(contentMode: .fit)
                                            .padding()
                                            .accessibilityLabel("\(name)")
                                            .accessibilityIdentifier("CurrentImage")
                                    }
                                } else {
                                    Image(systemName: "questionmark.circle.dashed")
                                        .resizable()
                                        .imageScale(.large)
                                        .foregroundStyle(.tint)
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .accessibilityLabel("\(name)")
                                        .accessibilityIdentifier("CurrentImage")
                                        .onTapGesture {
                                            if tile.contents != nil {
                                                tile.contents = nil
                                            } else {
                                                tile.contents = name
                                                unrevealedTreasures -= 1
                                            }
                                             tapCount += 1
                                        }
                                }
                            }
                        }
 
                    }
                }
            }
            .onAppear {
                b = Board(stepperVal: stepperVal)
                
                for _ in 1...treasureVal {
                    let randomRow = Int.random(in: 0..<stepperVal)
                    let randomCol = Int.random(in: 0..<stepperVal)
                    b?.board[randomRow][randomCol].contents = name
                }
            }
            .onReceive(timer) { _ in
                showTreasure = false
            }
        }
    }
}

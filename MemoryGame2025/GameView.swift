import SwiftUI

struct GameView: View {
    @Binding var name: String
    @Binding var showSetting: Bool
    @Binding var showGame: Bool
    @Binding var count: Int
    @Binding var stepperVal: Int
    @Binding var treasureVal: Int
    
    @State private var b: Board? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                if let board = b {
                    ForEach(board.board, id: \.first!.id) { row in
                        HStack {
                            ForEach(row) { tile in
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
        }
    }
}

import 'ChessBoardBox.dart';
import 'ChessPiece.dart';
import 'ChessUtils.dart';
class ChessBoard {
  late List<List<ChessBoardBox>> boxes;

  ChessBoard() {
    boxes = List.generate(8, (i) =>
        List.generate(8, (j) => ChessBoardBox(i, j, null))
    );
  }



  ChessBoardBox getBox(int x, int y) {
    return boxes[x][y];
  }

  void setPiece(String pos, ChessPiece piece) {
    var coords = ChessUtils.parsePosition(pos);
    boxes[coords[0]][coords[1]].piece = piece;
  }

  ChessBoard copy() {
    ChessBoard newBoard = ChessBoard();
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        newBoard.boxes[i][j].piece = boxes[i][j].piece;
      }
    }
    return newBoard;
  }

  void printBoard() {
    for (int i = 0; i < 8; i++) {
      String row = "";
      for (int j = 0; j < 8; j++) {
        row += "${boxes[i][j]} ";
      }
      print(row);
    }
  }
}

import 'ChessPiece.dart';
import 'ChessBoard.dart';
import 'ChessBoardBox.dart';
import 'ChessUtils.dart';
class ChessGameService {
  ChessBoard board = ChessBoard();

  // Initialize board with given puzzle positions
  void initializePuzzle(Map<String, String> setup) {
    setup.forEach((pos, pieceCode) {
      ChessPiece piece;
      bool isWhite = pieceCode.startsWith("W");
      String p = pieceCode.substring(1);

      switch (p) {
        case "K": piece = King(isWhite); break;
        case "Q": piece = Queen(isWhite); break;
        case "R": piece = Rook(isWhite); break;
        case "B": piece = Bishop(isWhite); break;
        case "H": piece = Knight(isWhite); break;
        case "P": piece = Pawn(isWhite); break;
        default: throw Exception("Unknown piece $p");
      }

      board.setPiece(pos, piece);
    });
  }

  // Move from "A1" → "A2"
  ChessBoard move(String from, String to) {
    var start = ChessUtils.parsePosition(from);
    var end = ChessUtils.parsePosition(to);

    ChessBoardBox startBox = board.getBox(start[0], start[1]);
    ChessBoardBox endBox = board.getBox(end[0], end[1]);
    ChessPiece? piece = startBox.piece;

    if (piece == null) throw Exception("No piece at $from");

    if (!piece.isValidMove(start[0], start[1], end[0], end[1], board)) {
      throw Exception("Invalid move for ${piece.symbool}");
    }

    ChessBoard newBoard = board.copy();
    newBoard.getBox(end[0], end[1]).piece = piece;
    newBoard.getBox(start[0], start[1]).piece = null;

    board = newBoard;
    return newBoard;
  }

  // List all valid moves for a piece at "E5"
  List<String> getValidMoves(String pos) {
    var start = ChessUtils.parsePosition(pos);
    ChessBoardBox box = board.getBox(start[0], start[1]);
    ChessPiece? piece = box.piece;

    List<String> moves = [];
    if (piece == null) return moves;

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (piece.isValidMove(start[0], start[1], i, j, board)) {
          moves.add(ChessUtils.posToString(i, j));
        }
      }
    }
    return moves;
  }
}

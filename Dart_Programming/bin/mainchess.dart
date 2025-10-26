import '../lib/chessgame/ChessGameService.dart';

void main() {
  ChessGameService game = ChessGameService();

  // Puzzle setup
  Map<String, String> setup = {
    "H1": "WK",
    "A1": "WQ",
    "G2": "WP",
    "H2": "WP",
    "E5": "BK",
    "E4": "BP",
    "F4": "BP",
    "B3": "BH"
  };

  game.initializePuzzle(setup);
  print("Initial Board:");
  game.board.printBoard();

  // Example: get valid moves for White Queen at A1
  print("Valid moves for WQ at A1: ${game.getValidMoves("A1")}");

  // Example: move White Queen from A1 → A4
  game.move("A1", "A4");
  print("After Move:");
  game.board.printBoard();
}

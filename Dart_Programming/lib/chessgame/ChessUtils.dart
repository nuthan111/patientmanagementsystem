class ChessUtils {
  // Convert like "A8" → [0,0]
  static List<int> parsePosition(String pos) {
    int row = 8 - int.parse(pos[1]); // "8" → row 0
    int col = pos.codeUnitAt(0) - 'A'.codeUnitAt(0);
    return [row, col];
  }

  // Convert back like [0,0] → "A8"
  static String posToString(int x, int y) {
    String col = String.fromCharCode('A'.codeUnitAt(0) + y);
    int row = 8 - x;
    return "$col$row";
  }
}

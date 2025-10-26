import 'MineSweeperBoard.dart';

class MineSweeperGame {
  final MineSweeperBoard board;
  bool gameOver = false;

  MineSweeperGame({required this.board});

  void openSquare(int boxIndex) {
    if (gameOver || boxIndex < 0 || boxIndex >= board.size * board.size) {
      print("INVALID MOVE");
      return;
    }

    final cell = board.getBox(boxIndex);

    if (cell.isOpened) {
      print("INVALID MOVE");
      return;
    }

    board.openBox(boxIndex);

    if (cell.isMine) {
      print("You hit a mine! Game Over!");
      board.printBoard(revealAll: true);
      gameOver = true;
      return;
    }

    // Open nearby 0’s recursively
    if (cell.value == 0) {
      _floodOpen(boxIndex);
    }

    board.printBoard();

    if (_checkWin()) {
      print("You Win!");
      gameOver = true;
    }
  }

  void _floodOpen(int index) {
    final cell = board.getBox(index);
    if (cell.isMine || cell.isOpened) return;

    cell.isOpened = true;
    if (cell.value != 0) return;

    // Recursively open neighbors
    for (int n in _neighbors(index)) {
      _floodOpen(n);
    }
  }

  List<int> _neighbors(int index) {
    int size = board.size;
    int row = index ~/ size;
    int col = index % size;
    List<int> result = [];

    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;
        int newRow = row + dx;
        int newCol = col + dy;
        if (newRow >= 0 && newRow < size && newCol >= 0 && newCol < size) {
          result.add(newRow * size + newCol);
        }
      }
    }
    return result;
  }

  bool _checkWin() {
    for (int i = 0; i < board.size * board.size; i++) {
      final cell = board.getBox(i);
      if (!cell.isOpened && !cell.isMine) return false;
    }
    return true;
  }
}

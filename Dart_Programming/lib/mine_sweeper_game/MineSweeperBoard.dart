import 'dart:io';
import 'dart:math';
import 'MineSweeperBox.dart';

class MineSweeperBoard {
  final int size;
  final int mines;
  
  final List<MineSweeperBox> _squares;

  MineSweeperBoard({required this.size, required this.mines})
      : _squares = List<MineSweeperBox>.generate(
      size * size, (_) => MineSweeperBox(0)) {
    _placeMines();
    _calculateNumbers();
  }

  void _placeMines() {
    final Random rand = new Random();
    int placed = 0;

    while (placed < mines) {
      int index = rand.nextInt(size * size);
      if (!_squares[index].isMine) {
        _squares[index] = MineSweeperBox(-1);
        placed++;
      }
    }
  }

  void _calculateNumbers() {
    for (int i = 0; i < size * size; i++) {
      if (_squares[i].isMine) continue;
      int count = 0;
      for (int n in _neighbors(i)) {
        if (_squares[n].isMine) count++;
      }
      _squares[i] = MineSweeperBox(count);
    }
  }

  List<int> _neighbors(int index) {
    int row = index ~/ size;
    int col = index % size;
    List<int> result = [];

    for (int dx = -1; dx <= 1; dx++) {
      for (int dy = -1; dy <= 1; dy++) {
        if (dx == 0 && dy == 0) continue;
        int newRow = row + dx;
        int newCol = col + dy;
        if (newRow >= 0 &&
            newRow < size &&
            newCol >= 0 &&
            newCol < size) {
          result.add(newRow * size + newCol);
        }
      }
    }
    return result;
  }

  MineSweeperBox getBox(int index) => _squares[index];

  void openBox(int index) {
    _squares[index].isOpened = true;
  }

  void printBoard({bool revealAll = false}) {
    for (int i = 0; i < size * size; i++) {
      if (i % size == 0) print('');
      final cell = _squares[i];

      if (revealAll || cell.isOpened) {
        if (cell.isMine) {
          stdout.write('* ');
        } else {
          stdout.write('${cell.value} ');
        }
      } else {
        stdout.write('* ');
      }
    }
    print('\n');
  }
}

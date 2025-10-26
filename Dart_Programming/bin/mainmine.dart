import '../lib/mine_sweeper_game/MineSweeperBoard.dart';
import '../lib/mine_sweeper_game/MineSweeperGame.dart';

void main() {
  var board = MineSweeperBoard(size: 10, mines: 15);
  var game = MineSweeperGame(board: board);

  board.printBoard(); // Initial board with dots

  game.openSquare(0);
  game.openSquare(55);
  game.openSquare(96);
}

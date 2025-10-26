import 'SL_Board.dart';
import 'SL_Dice.dart';
import '../snake_and_ladder/SL_Player.dart';

class SL_Game {

  final SL_Board board;
  final List<SL_Player> players;
  final SL_Dice dice;


  SL_Game(this.board,this.players,this.dice);

  SL_Player? playTurn(SL_Player player) {
    int roll = dice.roll();
    player.move(roll);
    player.position = board.getNewPosition(player.position);

    if (player.position >= board.board_size) {
      return player; // Winner
    }
    return null;
  }


  

}
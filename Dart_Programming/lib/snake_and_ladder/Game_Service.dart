import '../snake_and_ladder/SL_Player.dart';
import '../snake_and_ladder/SL_Game.dart';
class Game_Service{
 
  final SL_Game game;

  Game_Service(this.game);

  void start() {
    bool gameOver = false;
    SL_Player? winner;

    while (!gameOver) {
      for (var player in game.players) {
        winner = game.playTurn(player);
        print("${player.name} rolled and is now at ${player.position}");

        if (winner != null) {
          print("Winner: ${winner.name}!");
          gameOver = true;
          break;
        }
      }
    }
  }
}
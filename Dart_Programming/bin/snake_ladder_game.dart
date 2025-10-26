import 'dart:io';

// Import from lib folder using package style
import '../lib/snake_and_ladder/SL_Board.dart';
import '../lib/snake_and_ladder/SL_Player.dart';
import '../lib/snake_and_ladder/SL_Dice.dart';
import '../lib/snake_and_ladder/SL_Game.dart';
import '../lib/snake_and_ladder/Game_Service.dart';

void main() {
  final snakes = {
    16: 6,
    47: 26,
    49: 11,
    56: 53,
    62: 19,
    64: 60,
    87: 24,
    93: 73,
    95: 75,
    98: 78,
  };

  final ladders = {
    1: 38,
    4: 14,
    9: 31,
    21: 42,
    28: 84,
    36: 44,
    51: 67,
    71: 91,
    80: 100,
  };

  stdout.write("Enter number of players: ");
  int numPlayers = int.parse(stdin.readLineSync()!);

  List<SL_Player> players = [];
  for (int i = 1; i <= numPlayers; i++) {
    stdout.write("Enter name for Player $i: ");
    String name = stdin.readLineSync()!;
    players.add(SL_Player(name));
  }

  final board = SL_Board(100, snakes, ladders);
  final dice = SL_Dice();
  final game = SL_Game(board, players, dice);
  final service =Game_Service(game);

  print("\n Starting Snake and Ladders Game...");
  print("Players: ${players.map((p) => p.name).join(", ")}");
  print("Board Size: ${board.board_size}");
  print("Snakes: $snakes");
  print("Ladders: $ladders\n");

  service.start();
}

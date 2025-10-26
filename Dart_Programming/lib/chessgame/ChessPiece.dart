import 'ChessBoard.dart';
abstract class ChessPiece
{
 final bool isWhite;
ChessPiece(this.isWhite);

String get symbool;
String get name;

bool isValidMove(int startX,int startY,int endX,int endY,ChessBoard board);
}

class King extends ChessPiece
{
King(bool isWhite):super(isWhite);

@override
String get symbool=>isWhite?"Wk":"BK";

@override
String get name=>"king";

@override

bool isValidMove(int sx,int sy,int ex,int ey,ChessBoard board)
{
return(sx-ex).abs() <=1 && (sy-ey).abs()<=1;
}
}
class Queen extends ChessPiece
{
Queen(bool isWhite):super(isWhite);

@override
String get symbool=>isWhite?"WQ":"BQ";

@override
String get name=>"Queen";

@override

bool isValidMove(int sx,int sy,int ex,int ey,ChessBoard board)
{
 return (sx == ex || sy == ey || (sx - ex).abs() == (sy - ey).abs());
}
}
class Rook extends ChessPiece {
  Rook(bool isWhite) : super(isWhite);
  @override String get symbool => isWhite ? "WR" : "BR";
  @override String get name => "Rook";

  @override
  bool isValidMove(int sx, int sy, int ex, int ey, ChessBoard board) {
    return (sx == ex || sy == ey);
  }
}

class Bishop extends ChessPiece {
  Bishop(bool isWhite) : super(isWhite);
  @override String get symbool => isWhite ? "WB" : "BB";
  @override String get name => "Bishop";

  @override
  bool isValidMove(int sx, int sy, int ex, int ey, ChessBoard board) {
    return (sx - ex).abs() == (sy - ey).abs();
  }
}

class Knight extends ChessPiece {
  Knight(bool isWhite) : super(isWhite);
  @override String get symbool => isWhite ? "WH" : "BH";
  @override String get name => "Knight";

  @override
  bool isValidMove(int sx, int sy, int ex, int ey, ChessBoard board) {
    int dx = (sx - ex).abs();
    int dy = (sy - ey).abs();
    return (dx == 2 && dy == 1) || (dx == 1 && dy == 2);
  }
}

class Pawn extends ChessPiece {
  Pawn(bool isWhite) : super(isWhite);
  @override String get symbool => isWhite ? "WP" : "BP";
  @override String get name => "Pawn";

  @override
  bool isValidMove(int sx, int sy, int ex, int ey, ChessBoard board) {
    int direction = isWhite ? -1 : 1;
    return (sx + direction == ex && sy == ey);
  }
}




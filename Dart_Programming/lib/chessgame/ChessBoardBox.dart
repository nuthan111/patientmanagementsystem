import 'ChessPiece.dart';
class ChessBoardBox
{
final int x;
final int y;
ChessPiece? piece;

ChessBoardBox(this.x,this.y,this.piece);

@override
String toString()
{
return piece?.symbool?? "--";
}
}

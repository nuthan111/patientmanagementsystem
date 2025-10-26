class SL_Board{
final int board_size;
final Map<int,int> snakes;
final Map<int,int> ladder;

SL_Board(this.board_size,this.snakes,this.ladder);


int getNewPosition(int position)
{
  if(snakes.containsKey(position))
  {
    return snakes[position]!;
  }
  else if(ladder.containsKey(position))
  {
    return ladder[position]!;
  }

  return position;
}

}
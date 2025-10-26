class SL_Player {

final String name;
int position=0;


SL_Player(this.name);

void move(int steps)
{
  position += steps;
}

@override
String toString() => "$name at $position";
}
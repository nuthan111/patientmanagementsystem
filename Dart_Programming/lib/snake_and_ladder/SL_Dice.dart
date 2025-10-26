import 'dart:math';

 abstract class IRollable{
        int roll();
    }
  class SL_Dice implements IRollable{

    final Random random=Random();

@override
int roll() =>random.nextInt(6)+1;
   
} 

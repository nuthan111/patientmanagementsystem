import 'dart:collection';
import 'dart:math';

class Patient
{
  String name;
  int age;
  double height;
  double weight;
  String gender;
  
  
  Patient(this.name,this.age,this.height,this.weight,this.gender);
  String toString()
  {
    return "Patient(name:$name,age:$age,height:$height,weight:$weight,gender:$gender)";
    }
  
  
}
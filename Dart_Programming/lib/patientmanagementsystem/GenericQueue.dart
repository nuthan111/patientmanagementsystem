import 'dart:collection';
class GenericQueue<T>
{
  //Queue<T> queue=Queue<T>();

  List<T> queue=[];

   
  
  void enqueue(T item)
  {
    queue.add(item);
  }
  
  T? dequeue()
  {
    if(queue.isEmpty)
      return null;
    return queue.removeAt(0);

  }
  
  bool get isEmpty=>queue.isEmpty;
  

 }
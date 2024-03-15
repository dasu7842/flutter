//Create a program using List
void main()
{

  List<int> numbers = [1, 2, 3, 4, 5];

  // Printing the list
  print("main list: $numbers");

  numbers.add(6);
  print("After adding 6: $numbers");

  // Removing an element from the list
  numbers.remove(3);
  print("After removing 3: $numbers");


}

//Write a program make a summation of given number(E.g. 1523 ans :-11)
import 'dart:io';

void main()
{
  double n, i, sum = 0, m;
  print("Enter a Value : ");
  n=double.parse(stdin.readLineSync()!);

  for (i = n; i > 0; i = i / 10) // for loop
      {
    m = i % 10;
    sum = sum + m;
  }
  print("Total is :$sum");
}
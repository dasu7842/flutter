/*Write a program to find out the max from given number (E.g. No: -1562
Max number is 6 */
import 'dart:io';

void main()
{
  double n, i, max = 0, a; // variable
  print("Enter No : ");
 n=double.parse(stdin.readLineSync()!);

  for (i = n; i > 0; i /= 10) // for loop
      {
    a = i % 10;
    if (a > max)
    {
      max = a;
    }
  }
  print("max number is: $max");
}
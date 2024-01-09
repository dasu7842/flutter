// write a program you have to print the table of given number.
import 'dart:io';

void main()

{
  int a,number,total;
  print("Enter number:");
  number=int.parse(stdin.readLineSync()!);
  for(a=1;a<=10;a++)
    {
      total=number*a;
      print("\n$number*$a=$total");
    }

}
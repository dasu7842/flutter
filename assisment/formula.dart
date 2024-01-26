// Write a program to make addition, Subtraction, Multiplication and
// Division of Two Numbers.
import 'dart:io';

void main()
{
  double x,y;

  print("enter a first number:");
  x=double.parse(stdin.readLineSync()!);

  print("enter a second number:");
  y=double.parse(stdin.readLineSync()!);

   double addition=x+y;
   double sub=x-y;
   double mul=x*y;
   double div=x/y;

   print("addition is:$addition");
   print("subtraction is:$sub");
   print("Multiplication is:$mul");
   print("division is :$div");

}
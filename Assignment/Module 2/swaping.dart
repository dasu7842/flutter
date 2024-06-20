//Write a Program to show swap of two No's without using third variable.
import 'dart:io';

void main() {

  int num1, num2;

  print("Enter the first number: ");
  num1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number: ");
  num2 = int.parse(stdin.readLineSync()!);

  // Swapping without using a third variable
  num1 = num1 + num2;
  num2 = num1 - num2;
  num1 = num1 - num2;


  print("After swapping:");
  print("First number: $num1");
  print("Second number: $num2");
}

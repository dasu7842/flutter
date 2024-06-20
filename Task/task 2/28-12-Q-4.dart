//Write a Program to check the number is odd or even
import 'dart:io';

void main() {
  // Declare a variable
  int number;

  // Get input from the user
  print("Enter a number: ");
  number = int.parse(stdin.readLineSync()!);

  // Checking number is odd or even
  if (number % 2 == 0) {
    print("number is even number");
  } else {
    print("number is odd number.");
  }
}

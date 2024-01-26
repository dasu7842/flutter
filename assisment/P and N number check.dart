//Write a Program to check the given number is Positive, Negative.
import 'dart:io';

void main() {
  // Declare a variable to store the input number
  int number;

  // Get input from the user
  print("Enter a number: ");
  number = int.parse(stdin.readLineSync()!);

  // Check if the number is positive, negative, or zero
  if (number > 0)
  {
    print("The number is positive.");
  }
  else if (number < 0)
  {
    print("The number is negative.");
  }
  else
  {
    print("The number is zero.");
  }
}





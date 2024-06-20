/*Write a Program of Addition, Subtraction ,Multiplication and
Division using Switch case.(Must Be Menu Driven) */


import 'dart:io';

void main() {
  while (true) {
    print("Menu:");
    print("1. Addition");
    print("2. Subtraction");
    print("3. Multiplication");
    print("4. Division");
    print("5. Exit");

    stdout.write("Enter your choice (1-5): ");
    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        performAddition();
        break;
      case "2":
        performSubtraction();
        break;
      case "3":
        performMultiplication();
        break;
      case "4":
        performDivision();
        break;
      case "5":
        print("Exiting the program");
        return;
      default:
        print("Invalid choice. Please enter a valid option.");
    }
  }
}

void performAddition() {
  double num1,num2;
  print("Enter the first number: ");
  num1=double.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  num2=double.parse(stdin.readLineSync()!);
  double result = num1 + num2;
  print("Result of addition: $result");
}

void performSubtraction() {
  double num1,num2;
  print("Enter the first number: ");
  num1=double.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  num2=double.parse(stdin.readLineSync()!);
  double result = num1 - num2;

  print("Result of subtraction: $result");
}

void performMultiplication() {
  double num1,num2;
  print("Enter the first number: ");
  num1=double.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  num2=double.parse(stdin.readLineSync()!);
  double result = num1 * num2;
  print("Result of multiplication: $result");
}

void performDivision() {
  double num1,num2;
  print("Enter the first number: ");
  num1=double.parse(stdin.readLineSync()!);
  print("Enter the second number: ");
  num2=double.parse(stdin.readLineSync()!);
  double result = num1 /num2;
  print("Result of division: $result");
  }




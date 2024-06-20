/* Write a program of to find out the Area of Triangle, Rectangle and
Circle using If Condition.(Must Be Menu Driven) */

import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print("Menu:");
    print("1. Calculate Area of Triangle");
    print("2. Calculate Area of Rectangle");
    print("3. Calculate Area of Circle");
    print("4. Exit");

    stdout.write("Enter your choice (1-4): ");
    String choice = stdin.readLineSync() ?? "";

    if (choice == "1") {
      calculateTriangleArea();
    } else if (choice == "2") {
      calculateRectangleArea();
    } else if (choice == "3") {
      calculateCircleArea();
    } else if (choice == "4") {
      print("Exiting the program. Goodbye!");
      break;
    } else {
      print("Invalid choice. Please enter a valid option.");
    }
  }
}

void calculateTriangleArea()
{
  double base,height,area;
  print("Enter the base of the triangle: ");
  base=double.parse(stdin.readLineSync()!);
  print("Enter the height of the triangle: ");
  height=double.parse(stdin.readLineSync()!);
  area = 0.5 * base * height;
  print("Area of the triangle: $area");
}

void calculateRectangleArea()
{
  double length,width;
  print("Enter the length of the rectangle: ");
  length=double.parse(stdin.readLineSync()!);
  print("Enter the width of the rectangle: ");
  width=double.parse(stdin.readLineSync()!);
  double area = length * width;
  print("Area of the rectangle: $area");
}

void calculateCircleArea()
{
  double radius;
  print("Enter the radius of the circle: ");
  radius=double.parse(stdin.readLineSync()!);
  double area = pi * radius * radius;
  print("Area of the circle: $area");
}


/*Write a program to convert temperature from degree centigrade to
 Fahrenheit.*/

import 'dart:io';

void main() {

  double celsius, fahrenheit;


  print("Enter temperature in Celsius: ");
  celsius = double.parse(stdin.readLineSync()!);

  // Convert Celsius to Fahrenheit
  fahrenheit = (celsius * 9 / 5) + 32;

  // Display the result
  print("answer is:$fahrenheit");
}

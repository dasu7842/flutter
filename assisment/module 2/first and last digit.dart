/*Write a program you have to make a summation of first and last Digit.
 (E.g. 1234 ans:-5)*/

import 'dart:io';

void main()
{
  double n,sum=0,firstdigit,lastdigit;

  print("Enter a number:");
  n=double.parse(stdin.readLineSync()!);

  lastdigit = n % 10;//modulation

  while(n >= 10)
  {
    n = n / 10;
  }
  firstdigit = n;
  //Calculate sum of first and last digit
  sum = firstdigit + lastdigit;
  print("Sum of first and last digit is: $sum");

}

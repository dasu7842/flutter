// Write a program to find the Area of Circle
 import 'dart:io';

void main()
{
  double r,area;
  print("Enter radious of the circle:");
  r=double.parse(stdin.readLineSync()!);

  //calculate area of circle

  area=3.14*r*r;

  print("Area of circle is:$area");

}
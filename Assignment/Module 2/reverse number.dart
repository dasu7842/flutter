import 'dart:io';

void main()
{
  double n,reverse,remainder;

  print("Enter number to reverse:");
  n=double.parse(stdin.readLineSync()!);

  while (n != 0) {
    remainder = n % 10;
    reverse = reverse * 10 + remainder;
    n /= 10;
  }
  print("Reversed number is:$reverse");


}

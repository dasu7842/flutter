//Write a program you have to find the factorial of given number.

import 'dart:io';

void main()
{
  double n,i,fact=1;

  print("enter number to find a factorial:");
  n=double.parse(stdin.readLineSync()!);

  for(i=1;i<=n;i++)
    {
      fact=fact*i;
    }

    print("factorial is:$fact");

}
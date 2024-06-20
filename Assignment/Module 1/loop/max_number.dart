import 'dart:io';

void main()
{
  double n, i, max = 0, a; // variable
  print("Enter No : ");
 n=double.parse(stdin.readLineSync()!);

  for (i = n; i > 0; i /= 10) // for loop
      {
    a = i % 10;
    if (a > max)
    {
      max = a;
    }
  }
  print("max number is: $max");
}
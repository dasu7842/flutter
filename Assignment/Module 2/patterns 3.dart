/*
1
22
333
4444
55555
 */
import 'dart:io';

void main()
{
  for (int i = 1; i <= 5; i++) //row
  {
    for (int j = 1; j <= i; j++)//column
    {
      stdout.write(i);
    }

    print("");
  }
}





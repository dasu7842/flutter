/*
    1
   2 2
  3 3 3
 4 4 4 4
5 5 5 5 5
 */

import 'dart:io';

void main()
{
  for (int i = 1; i <= 5; i++) //row
  {

    for (int j = 5; j > i; j--) //column
    {
      stdout.write(" ");
    }

    // Print numbers
    for (int k = 1; k <= i; k++)
    {
      stdout.write("$i ");
    }


    print("");
  }
}

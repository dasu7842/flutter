/*
    1
   21
  321
 4321
54321
 */

import 'dart:io';

void main()
{
  for (int i = 1; i <= 5; i++) //row
  {

    for (int j = 5; j > i; j--)  //to side space
    {
      stdout.write(" ");
    }


    for (int k = i; k >= 1; k--)  //column print
    {
      stdout.write(k);
    }


    print("");
  }
}

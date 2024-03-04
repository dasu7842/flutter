/*
A
BB
CCC
DDDD
EEEEE
*/

import 'dart:io';

void main() {
  int i, j;//varible
  for (i = 65; i <= 69; i++)
  {
    for (j = 65; j <= i; j++)
    {
      stdout.write(String.fromCharCode(i));//print
    }
    print("");// for space
  }
}
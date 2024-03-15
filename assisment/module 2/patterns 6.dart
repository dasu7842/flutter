/*
     *
    * *
   * * *
  * * * *
 * * * * *
 */
import 'dart:io';

void main() {
  for (int i = 1; i <= 5; i++) //row
      {
    for (int j = 5; j > i; j--) //to side space
        {
      stdout.write(" ");
    }
    for (int k = 1; k <= i; k++) //column
        {
      stdout.write("* ");
    }
    print("");
  }
}
/*
1
12
123
1234
12345
 */
import 'dart:io';

void main()
{
  for(int i=1;i<=5;i++)//row
    {
      for(int j=1;j<=i;j++)//column
        {
          stdout.write(j);
        }
      print("");
    }

}
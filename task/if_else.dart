//Chek student grade using if else

import 'dart:io';

void main()
{
  print("Enter a percentage:"); //get percentag from user
  int pr=int.parse(stdin.readLineSync()!); //to get value

  if(pr>80)   //condtion
    {
      print("student grade is A");
    }
  else if(pr>60)
    {
      print("student grade is B");
    }
  else if(pr>50)
    {
      print("student grade is C");

    }
  else if(pr>=40)
    {
      print("student grade is D");
    }
  else
    {
      print("failed");
    }
}
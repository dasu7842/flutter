//nested if check eligibility for voting

import'dart:io';
void main()
{
  print("Enter your age:");
  int age=int.parse(stdin.readLineSync()!);


  if(age>=18)
    {
      print("Eligible for voting");

      if(age>60)
      {
       print("Cinier citizen");
      }
      else
        {
          print("Young age");
        }
    }
  else
    {
      print("Not elgible for voting");
    }
}
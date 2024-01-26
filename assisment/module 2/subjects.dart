/*Write a program to calculate sum of 5 subjects & find the percentage.
Subject marks entered by user.*/
import 'dart:io';
void main()
{
  int total;
  double per;

  print("Enter maths marks:");
  int? maths = int.parse(stdin.readLineSync()!);

  print("Enter history marks:");
  int? history = int.parse(stdin.readLineSync()!);
  print("Enter hindi marks:");
  int? hindi = int.parse(stdin.readLineSync()!);
  print("Enter eng marks:");
  int? eng= int.parse(stdin.readLineSync()!);
  print("Enter guj marks:");
  int? guj = int.parse(stdin.readLineSync()!);

  total=maths+history+hindi+eng+guj;
  per=(total/500)*100;

  if(per>75)
    {
      print("Distinction");
    }
  else if(per<=75)
    {
      print( "First class");
    }
  else if(per<=60)
    {
      print("Second class");
    }
  else if(per<=50)
    {
      print("“Pass class");
    }
  else
    {
      print("failed");
    }

  print("total marks is:$total");
  print("percantage is:$per");


}
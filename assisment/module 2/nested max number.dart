/*Write a program to find the Max number from the given three
 number using Nested If */

void main() {

  int num1 = 100;
  int num2 = 200;
  int num3 = 15;

  if (num1 >= num2)
  {
    if (num1 >= num3)
    {
      print('$num1 is the maximum number.');
    } else
    {
      print('$num3 is the maximum number.');
    }
  } else
  {
    if (num2 >= num3)
    {
      print('$num2 is the maximum number.');
    } else {
      print('$num3 is the maximum number.');
    }
  }
}

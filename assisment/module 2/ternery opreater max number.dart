/*Write a program to find the Max number from the given three
 number using Ternary Operator*/

void main() {

  int num1 = 100;
  int num2 = 20;
  int num3 = 123;


  int maxNumber = (num1 > num2) ? ((num1 > num3) ? num1 : num3) : ((num2 > num3) ? num2 : num3);

  print('The maximum number is: $maxNumber');
}

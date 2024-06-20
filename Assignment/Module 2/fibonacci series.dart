/*Write a program you have to print the Fibonacci series up to user given
 number*/

import 'dart:io';


int main() {

  int i, n;
  int t1 = 0, t2 = 1;
  int nextTerm = t1 + t2;


  print("Enter the number of terms: ");
 n=int.parse(stdin.readLineSync()!);

  print(t1);
  print(t2);


  for (i = 2; i <= n; i++)
  {
    print (nextTerm);
    t1 = t2;
    t2 = nextTerm;
    nextTerm = t1 + t2;
  }


  return 0;
}

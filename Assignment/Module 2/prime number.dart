import 'dart:io';

void main()
{
  int n,i,count=0;

  print("enter any number:");
  n=int.parse(stdin.readLineSync()!);

  for(i=1;i<=n;i++)
    {
      if(n%i==0)
        {
          count++;
        }
    }
  if(count==2)

      print("prime number");

  else
    print("not prime number");


}

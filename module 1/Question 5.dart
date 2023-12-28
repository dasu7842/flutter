//Write a program to calculate sum of 5 subjects & find the percentage.

int main()
{
  int maths,history,hindi,eng,guj,total;
  double per;

  maths=70;
  history=60;
  hindi=80;
  eng=50;
  guj=90;

  total=maths+history+hindi+eng+guj;
  per=(total/500)*100;

  print("total marks is:$total");
  print("percantage is:$per");

  return 0;
}
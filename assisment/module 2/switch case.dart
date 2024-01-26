//Write Program use switch statement. Display Monday to Sunday
import 'dart:io';
void main()
{
  var n;
  print("Enter 1 to 7 number");
  n=int.parse(stdin.readLineSync()!);

  switch(n)
  {
    case 1: print("Your Selected day is Monday");
    break;

    case 2: print("Your Selected day is Tuesday");
    break;

    case 3: print("Your Selected day is Wednesday");
    break;

    case 4: print("Your Selected day is Thursday");
    break;

    case 5: print("Your Selected day is Friday");
    break;

    case 6: print("Your Selected day is Saturday");
    break;

    case 7:print("your Selected day is Sunday");
    break;
  }
}
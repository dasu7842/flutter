\*
2  
44
888
16161616
3232323232 */


import 'dart:io';
import 'dart:math';

void main() {
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('${pow(2, i)}');
    }
    print("");
  }
}

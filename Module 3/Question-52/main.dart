import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Operator { Addition, Subtraction, Multiplication, Division }

class _MyAppState extends State<MyApp> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  Operator _operator = Operator.Addition;
  double? result;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("calculater"), backgroundColor: Colors.red),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextFormField(
              controller: num1,
              decoration: InputDecoration(
                label: Text("Enter Number1"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: num2,
              decoration: InputDecoration(
                label: Text("Enter Number2"),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double n1 = double.tryParse(num1.text) ?? 0;
                double n2 = double.tryParse(num2.text) ?? 0;
                setState(() {
                  result = _calculate(n1, n2, _operator);
                });
              },
              child: Text("click"),
            ),
            SizedBox(height: 20),
            Text(
              result != null ? 'Result: $result' : '',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            buildRadioListTile("Addition", Operator.Addition),
            buildRadioListTile("Subtraction", Operator.Subtraction),
            buildRadioListTile("Multiplication", Operator.Multiplication),
            buildRadioListTile("Division", Operator.Division),
          ],
        ),
      ),
    );
  }

  RadioListTile<Operator> buildRadioListTile(String title, Operator value) {
    return RadioListTile<Operator>(
      title: Text(title),
      value: value,
      groupValue: _operator,
      onChanged: (Operator? selectedValue) {
        setState(() {
          _operator = selectedValue!;
        });
      },
    );
  }

  double? _calculate(double num1, double num2, Operator operator)
  {
    final functions = {
      Operator.Addition: (double a, double b) => a + b,
      Operator.Subtraction: (double a, double b) => a - b,
      Operator.Multiplication: (double a, double b) => a * b,
      Operator.Division: (double a, double b) => b != 0 ? a / b : null,
    };

    return functions[operator]!(num1, num2);
  }
}

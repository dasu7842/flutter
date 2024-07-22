import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'history.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Operator { Addition, Subtraction, Multiplication, Division }

class _MyAppState extends State<MyApp>
{
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  Operator _operator = Operator.Addition;
  double? result;

  final dbHelper = DbHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practical"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('History'),
                value: 'history',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Historyscreen()));
                },
              )
            ],
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: num1,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Number1",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: num2,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Number2",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: ()
                {
                  double n1 = double.tryParse(num1.text) ?? 0;
                  double n2 = double.tryParse(num2.text) ?? 0;
                  setState(()
                  {
                    result = _calculate(n1, n2, _operator);
                  });
                  String entry = '${num1.text} $_operator ${num2.text} = $result';
                  _insertEntry(entry);
                },
                child: Text("Click"),
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
      ),
    );
  }

  RadioListTile<Operator> buildRadioListTile(String title, Operator value) {
    return RadioListTile<Operator>(
      title: Text(title),
      value: value,
      groupValue: _operator,
      onChanged: (Operator? selectedValue) {
        setState(()
        {
          _operator = selectedValue!;
        });
        String entry = '${num1.text} $_operator ${num2.text} = $result';
        _insertEntry(entry);
      },
    );
  }

  void _insertEntry(String entry) async {
    int id = await dbHelper.insert(entry);
    print('Inserted entry with ID: $id');
  }

  double? _calculate(double num1, double num2, Operator operator) {
    final functions = {
      Operator.Addition: (double a, double b) => a + b,
      Operator.Subtraction: (double a, double b) => a - b,
      Operator.Multiplication: (double a, double b) => a * b,
      Operator.Division: (double a, double b) => b != 0 ? a / b : null,
    };

    return functions[operator]!(num1, num2);
  }
}

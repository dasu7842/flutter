import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final double sum;

  const SecondScreen({Key? key, required this.sum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Result'),
      ),
      body: Center(
        child: Text(
          'Sum: $sum',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
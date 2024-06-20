import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _vidioState();
}

class _vidioState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
       body: Center
         (
          child: Text('Video data'),
        ),
    );
  }
}

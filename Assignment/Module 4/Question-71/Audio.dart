import 'package:flutter/material.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _galleryState();
}

class _galleryState extends State<audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      body: Center
        (
        child:Text('Audio data'),
      ),
    );
  }
}

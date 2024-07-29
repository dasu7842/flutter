import 'package:flutter/material.dart';
import '../model.dart';

class UserDetailsScreen extends StatelessWidget
{
  final BloodRequestModel request;

  UserDetailsScreen({required this.request});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text('Request Details:'),
            Text('Blood Type: ${request.bloodType}'),
            Text('Quantity: ${request.quantity}'),
            Text('Message: ${request.message}'),
          ],
        ),
      ),
    );
  }
}
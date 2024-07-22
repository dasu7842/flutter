import 'package:flutter/material.dart';

class BloodBanksPage extends StatefulWidget {
  const BloodBanksPage({super.key});

  @override
  State<BloodBanksPage> createState() => _BloodBanksPageState();
}

class _BloodBanksPageState extends State<BloodBanksPage> {
  List<BloodBank> _bloodBanks = [
    BloodBank('Civil Hospital', 'Location :Rajkot'),
    BloodBank('Red Cross Blood Bank', 'Location :Rajkot'),
    BloodBank('Saurastra Voluntary Blood Bank', 'Location :Rajkot'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Banks'),backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _bloodBanks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_bloodBanks[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(_bloodBanks[index].location,style:TextStyle(color: Colors.black),),
          );
        },
      ),
    );
  }
}

class BloodBank {
  final String name;
  final String location;

  BloodBank(this.name, this.location);
}
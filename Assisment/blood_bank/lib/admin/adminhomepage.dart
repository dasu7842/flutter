import 'package:blood_bank/admin/searchdonarspage.dart';
import 'package:blood_bank/admin/viewalldonars.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../navigationdrawerpage.dart';
import 'admin blood request screen.dart';
import 'bloodbankspage.dart';
import 'donarpage.dart';


class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blood Hub',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: NavigationDrawerPage(isAdmin: true,),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            height: 180.0,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bloodtype, size: 50, color: Colors.white),
                  Text('B-', style: TextStyle(fontSize: 50, color: Colors.white)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _makePhoneCall('7201878872');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                'TAP TO CALL',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              children: [
                _buildGridTile(Icons.person_add, 'Add Donor', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddDonorPage()),
                  );
                }),
                _buildGridTile(Icons.search, 'Search Donors', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchDonorsPage()),
                  );
                }),
                _buildGridTile(Icons.check_circle, 'Approved Requests', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminBloodRequest()),
                  );
                }),
                _buildGridTile(Icons.local_hospital, 'Blood Banks', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BloodBanksPage()),
                  );
                }),
                _buildGridTile(Icons.people, 'View All Donors', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewDonorPage()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridTile(IconData icon, String title, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.blue),
              SizedBox(height: 16.0),
              Text(title, style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }

  void _makePhoneCall(String number) async {
    var url = Uri.parse("tel:$number");
    launchUrl(url);
  }
}

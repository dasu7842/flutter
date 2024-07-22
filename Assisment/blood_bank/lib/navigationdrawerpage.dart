import 'package:blood_bank/user/bloodrequest.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'admin/Deletedonarpage.dart';
import 'admin/Updatedonarpage.dart';
import 'admin/viewalldonars.dart';
import 'admin/donarpage.dart';

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({super.key});

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Blood',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            accountEmail: Text('Admin side'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange[600],
              child: Text(
                'B',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Add Donor',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDonorPage()),
              );
            },
          ),
          Divider(height: 10),
          ListTile(
            title: Text(
              'Update Donor',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateDonarPage()),
              );
            },
          ),
          Divider(height: 10),
          ListTile(
            title: Text(
              'Delete Donor',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DeleteDonarPage()),
              );
            },
          ),
          Divider(height: 10),
          ListTile(
            title: Text(
              'View All Donors',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllDonors()),
              );
            },
          ),
          Divider(height: 10),
          ListTile(
            title: Text(
              'Call Emergency Number',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            onTap: ()
            {
              _makePhoneCall('7201878872');
            },
          ),
          Divider(height: 10),
        ],
      ),
    );
  }

  void _makePhoneCall (String number)async
  {
    var url = Uri.parse("tel:$number");
    launchUrl(url);
  }

}
import 'package:blood_bank/user/bloodrequest.dart';
import 'package:flutter/material.dart';
import 'admin/admin blood request screen.dart';
import 'admin/bloodbankspage.dart';
import 'admin/donarpage.dart';
import 'admin/searchdonarspage.dart';
import 'admin/viewalldonars.dart';
import 'loginpage.dart';

class NavigationDrawerPage extends StatelessWidget
{
  final bool isAdmin;

  NavigationDrawerPage({required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:
      [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                'Blood Hub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              if (isAdmin)
                Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              else
                Text(
                  'User Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
        if (isAdmin) ...[   //conditionally includes the elements
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Add Donor'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDonorPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search Donors'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchDonorsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Approved Requests'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminBloodRequest()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Blood Banks'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BloodBanksPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('View All Donors'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewDonorPage()),
              );
            },
          ),
        ] else ...[
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Request Blood'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserBloodRequest()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital),
            title: Text('Blood Banks'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BloodBanksPage()),
              );
            },
          ),
        ],
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: ()
          {
            _logout(context);
          },
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
    );
  }
}

import 'package:flutter/material.dart';
import '../dbHelper.dart';
import '../model.dart';

class AdminBloodRequest extends StatefulWidget
{
  @override
  _AdminBloodRequestState createState() => _AdminBloodRequestState();
}

class _AdminBloodRequestState extends State<AdminBloodRequest> {
  late Future<List<BloodRequestModel>> _requests;

  @override
  void initState() {
    super.initState();
    _requests = DatabaseHelper().getRequests();
  }

  void _updateRequestStatus(BloodRequestModel request, String status) async
  {
    request.status = status;
    await DatabaseHelper().updateRequest(request);
    setState(() {
      _requests = DatabaseHelper().getRequests();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Request ${status}!')),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar
        (
        title: Text('Admin Blood Requests'),
        backgroundColor: Colors.blue,
      ),

      body: FutureBuilder<List<BloodRequestModel>>(
        future: _requests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No requests found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final request = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Blood Type: ${request.bloodType}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantity: ${request.quantity}'),
                        Text('Message: ${request.message}'),
                        Text('Status: ${request.status}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => _updateRequestStatus(request, 'approved'),
                          child: Text('Approve'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () => _updateRequestStatus(request, 'denied'),
                          child: Text('Deny'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

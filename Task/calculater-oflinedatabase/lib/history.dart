import 'package:flutter/material.dart';
import 'dbhelper.dart';

class Historyscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: DbHelper.instance.queryAllRows(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  String entry = snapshot.data![index][DbHelper.Entry];
                  return ListTile(
                    title: Text(entry),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

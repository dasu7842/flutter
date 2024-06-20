import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqfliteoffline1/Tform.dart';
import 'package:sqfliteoffline1/dbfile.dart';
import 'package:sqfliteoffline1/model.dart';


class listscreen extends StatefulWidget
{
@override
_listscreenState createState() => _listscreenState();
}

class _listscreenState extends State<listscreen> {
  List<perform> tasks = [];
  final db = dbhelper();

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite crud",style: TextStyle(color:Colors.blue),),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.blue,),
            onPressed: () {
              showSearch(context: context, delegate: TaskSearchDelegate(tasks));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          perform task = tasks[index];
          return Card(
            color: _getCardColor(task.date),
            //color: task.isCompleted ? Colors.green.shade100 : Colors.orange.shade100,
            child: ListTile(
              title: Row(
                children: [
                  Text('Name: '),
                  Text(
                    task.name,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              subtitle: Column
                (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Desc: ${task.desc}'),
                  Text('Date: ${task.date}'),
                  Text('Time: ${task.time}'),
                  Text('Priority: ${_Priority(task.priority)}', style: TextStyle(color: _PriorityColor(task.priority))),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => nextscreen(onSave: (updatedTask) {
                            db.update(updatedTask);
                            _refreshList();
                          },
                            task: task,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Delete ?',style: TextStyle(color: Colors.blue),),
                            content: Text('Are confirm to delete?',style:TextStyle(color: Colors.blue),),
                            actions: [
                              ElevatedButton(onPressed: ()
                              {
                                Navigator.of(context).pop();
                              },
                                  child: Text('Cancel')),

                              ElevatedButton(onPressed: ()
                              {
                                _delete(task.id!);
                                Navigator.of(context).pop();
                              },
                                  child: Text('Ok'))
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Complete the Task'),
                      content: Text('Mark this task completed?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel',style: TextStyle(color: Colors.yellow),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Complete',style: TextStyle(color: Colors.yellow),),
                          onPressed: () {
                            setState(() {
                              task.isCompleted = true;
                            });
                            db.update(task);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextscreen(onSave: (task) {
              db.insert(task);
              _refreshList();
            },
            ),
            ),
          );
        },
        child: Icon(Icons.add,color: Colors.blue,),
      ),
    );
  }

  String _Priority(int priority) {
    switch (priority) {
      case 0:
        return 'Low';
      case 1:
        return 'Average';
      case 2:
        return 'High';
      default:
        return '';
    }
  }

  _refreshList() async {
    List<perform> x = await db.get();
    setState(() {
      tasks = x;
    });
  }

  _delete(int id) async {
    await db.delete(id);
    _refreshList();
  }

  Color _PriorityColor(int priority) {
    switch (priority) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.red;
      default :
        return Colors.white60;
    }
  }
}
Color _getCardColor(String taskDate) {
  final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  return taskDate == currentDate ? Colors.blue : Colors.red;
}


//search
class TaskSearchDelegate extends SearchDelegate {
  final List<perform> tasks;
  TaskSearchDelegate(this.tasks);

  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];

  }

  @override
  Widget? buildLeading(BuildContext context)
  {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = tasks.where((task) => task.name.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile
          (
          title: Text(results[index].name),
          subtitle: Text(results[index].desc),
        );
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = tasks.where((task) => task.date.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        perform task = suggestions[index];
        return ListTile(
          title: Text(task.name),
          subtitle: Text(task.desc),
          onTap: () {
            query = task.date;
            showResults(context);
          },
        );
      },
    );
  }
}



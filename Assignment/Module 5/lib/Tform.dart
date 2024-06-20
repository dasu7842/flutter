import 'package:flutter/material.dart';
import 'package:sqfliteoffline1/model.dart';

class nextscreen extends StatefulWidget {
  final Function(perform) onSave;
  final perform? task;

  nextscreen({required this.onSave, this.task});

  @override
  _nextscreenState createState() => _nextscreenState();
}

class _nextscreenState extends State<nextscreen> {

  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _desc;
  late String _date;
  late String _time;
  late int _priority;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = widget.task?.name ?? '';
    _desc = widget.task?.desc ?? '';
    _date = widget.task?.date ?? '';
    _time = widget.task?.time ?? '';
    _priority = widget.task?.priority ?? 0;
    _dateController.text = _date;
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date.isNotEmpty ? DateTime.parse(_date) : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _date = picked.toString().split(' ')[0];
        _dateController.text = _date;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue,
        title: Text(widget.task == null ? 'Add' : 'Edit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView
          (
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),

                TextFormField(
                  initialValue: _name,
                  decoration: InputDecoration(labelText: 'NAME',border: OutlineInputBorder()),style: TextStyle(color: Colors.red),
                  onSaved: (val) => _name = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Name is not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormField(
                  initialValue: _desc,
                  decoration: InputDecoration(labelText: 'Description',border: OutlineInputBorder()),style: TextStyle(color: Colors.red),
                  onSaved: (val) => _desc = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Description is not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormField(keyboardType: TextInputType.datetime,
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  style: TextStyle(color: Colors.red),
                  onSaved: (val) => _date = val!,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Date is not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                TextFormField(keyboardType: TextInputType.datetime,
                  initialValue: _time,
                  decoration: InputDecoration(labelText: 'Time',border: OutlineInputBorder()),style: TextStyle(color: Colors.red),
                  onSaved: (val) => _time = val!,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Time is not empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                DropdownButtonFormField<int>(
                  value: _priority,
                  items: [
                    DropdownMenuItem(child: Text('Low'), value: 0),
                    DropdownMenuItem(child: Text('Average'), value: 1),
                    DropdownMenuItem(child: Text('High'), value: 2),
                  ],
                  onChanged: (value)
                  {
                    setState(() {
                      _priority = value!;
                    });
                  },
                  decoration: InputDecoration(labelText: 'Priority',border: OutlineInputBorder()),style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 20),

                ElevatedButton(onPressed: ()
                {

                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      widget.onSave(perform(
                        id: widget.task?.id,
                        name: _name,
                        desc: _desc,
                        date: _date,
                        time: _time,
                        priority: _priority,
                        isCompleted: widget.task?.isCompleted ?? false,
                      ));
                      Navigator.pop(context);
                    }
                }, child:Text('Insert',style: TextStyle(color: Colors.purple), )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

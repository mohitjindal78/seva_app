import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewSeva extends StatefulWidget {
  final Function addSeva;

  NewSeva({this.addSeva});

  @override
  _NewSevaState createState() => _NewSevaState();
}

class _NewSevaState extends State<NewSeva> {
  final _nameController = TextEditingController();
  final _amtController = TextEditingController();
  DateTime _selStartDate = DateTime.now();
  DateTime _selEndDate;

  void _submitData() {
    final _enteredName = _nameController.text;
    final _enteredAmt =
        double.parse(_amtController.text.isEmpty ? 0.00 : _amtController.text);

    if (_enteredName.isEmpty ||
        _enteredAmt <= 0 ||
        _selStartDate == null ||
        _selEndDate == null) {
      return;
    }
    widget.addSeva(
      _enteredName,
      _enteredAmt,
      _selStartDate,
      _selEndDate,
    );

    Navigator.of(context).pop();
  }

  void _startDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selStartDate = pickedDate;
      });
    });
  }

  void _endDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2099),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selEndDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Seva Name'),
              controller: _nameController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Seva Amount'),
              controller: _amtController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selStartDate == null
                          ? 'Select start Date'
                          : 'Start Date: \n${DateFormat.yMMMd().format(_selStartDate)}',
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: _startDatePicker,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _selEndDate == null
                          ? 'Select End Date'
                          : 'End Date: \n${DateFormat.yMMMd().format(_selEndDate)}',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _endDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Seva'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}

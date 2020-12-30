import 'package:flutter/material.dart';
import 'package:seva_app/widgets/seva_card.dart';
import 'package:seva_app/models/seva.dart';
import 'package:seva_app/screens/new_seva.dart';
import 'package:seva_app/screens/new_payment.dart';

class SevaScreen extends StatefulWidget {
  @override
  _SevaScreenState createState() => _SevaScreenState();
}

class _SevaScreenState extends State<SevaScreen> {
  final List<Seva> _activeSeva = [
    Seva(
        id: '001',
        sevaName: 'Generator Diesel Seva',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 7)),
        sevaAmount: 15000.00,
        sankalpAmount: 0.00,
        yogdanAmount: 0.00,
        sankalpFlag: true),
    Seva(
        id: '002',
        sevaName: 'Food service for MP people',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 5)),
        sevaAmount: 10000.00,
        sankalpAmount: 0.00,
        yogdanAmount: 0.00,
        sankalpFlag: true),
    Seva(
        id: '003',
        sevaName: 'Amarnath Yatra seva',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(Duration(days: 3)),
        sevaAmount: 150000.00,
        sankalpAmount: 0.00,
        yogdanAmount: 0.00,
        sankalpFlag: false),
  ];

  void _addNewSeva(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            //TODO: check for scrolling up on click of key pad
            child: NewSeva(
              addSeva: _newSeva,
            ),
          ),
        );
      },
    );
  }

  void _newSeva(
      String sevaName, double sevaAmt, DateTime startDate, DateTime endDate) {
    final newSeva = Seva(
      id: DateTime.now().toString(),
      sevaName: sevaName,
      sevaAmount: sevaAmt,
      startDate: startDate,
      endDate: endDate,
    );

    setState(() {
      _activeSeva.add(newSeva);
    });
  }

  void _acceptPayment(BuildContext ctx, Seva currentSeva) {
    Navigator.pushNamed(context, NewPayment.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: SevaCard(
            activeSeva: _activeSeva,
            acceptPayment: _acceptPayment,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          return _addNewSeva(context);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seva_app/models/seva.dart';

class SevaCard extends StatelessWidget {
  final List<Seva> activeSeva;
  final Function acceptPayment;

  SevaCard({this.activeSeva, this.acceptPayment});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        activeSeva[index].sevaName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'End Date: ' +
                          DateFormat.yMMMd().format(activeSeva[index].endDate),
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Se:${activeSeva[index].sevaAmount.toStringAsFixed(2)} '
                        'Sa:${activeSeva[index].sankalpAmount.toStringAsFixed(2)} '
                        'Yo:${activeSeva[index].yogdanAmount.toStringAsFixed(2)}',
                        //TODO: check for amount formating to X,XXX,XXX.XX
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  activeSeva[index].sankalpFlag
                      ? FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            children: [
                              Icon(
                                Icons.done_outline,
                                color: Colors.green,
                                size: 35.0,
                              ),
                            ],
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.payment),
                          iconSize: 40.0,
                          onPressed: () {
                            return acceptPayment(context, activeSeva[index]);
                          },
                        ),
                ],
              )
            ],
          ),
        );
      },
      itemCount: activeSeva.length,
    );
  }
}

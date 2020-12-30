import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:seva_app/models/satsangi.dart';

class SatsangiCard extends StatelessWidget {
  final List<Satsangi> activeSatsangi;

  SatsangiCard({this.activeSatsangi});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return Card(
          elevation: 0,
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
                        activeSatsangi[index].Name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    SizedBox(height: 5),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Add: ' +
                            activeSatsangi[index].address +
                            ', ' +
                            activeSatsangi[index].city,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 15.0,
                          ),
                          Text(
                            ' ' + activeSatsangi[index].phoneNumber + ' ',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          Icon(
                            Icons.email,
                            size: 15.0,
                          ),
                          Text(
                            ' ' + activeSatsangi[index].emailId,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    activeSatsangi[index].satsangiType.toUpperCase(),
                    style: TextStyle(color: Colors.pink),
                  )
                ],
              )
            ],
          ),
        );
      },
      itemCount: activeSatsangi.length,
    );
  }
}

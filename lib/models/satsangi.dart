import 'package:flutter/foundation.dart';

class Satsangi {
  final String id;
  final String Name; //Satsangi Name
  final String phoneNumber; //Satsangi Phone Number
  final String emailId; //email id of Satsangi
  final String city; //city of satsangi
  final String address; //address of Satsangi
  final String satsangiType; // SATSANGI, SEVADAR, ADHYAKSH, ADMIN
  final bool activeFlag; // Whether Satsangi is active true for active

  const Satsangi({
    @required this.id,
    @required this.Name,
    @required this.phoneNumber,
    @required this.emailId,
    @required this.city,
    @required this.address,
    this.satsangiType = 'SATSANGI',
    this.activeFlag = true,
  });
}

import 'package:flutter/foundation.dart';

class Seva {
  final String id;
  final String sevaName; //Description of Seva
  final DateTime startDate; //Date till when seva is valid
  final DateTime endDate; //Date till when seva is valid
  final double sevaAmount; //Amount required for this seva
  final double sankalpAmount; //Total Sankal taken by people
  final double yogdanAmount; //Total amount collected
  final bool
      sankalpFlag; // Whether person logged in has already taken sankalp for this seva
  final double mySankalpAmount; //Total Sankal taken by person logged in
  final double myYogdanAmount; // Total Yogdan made by person logged in

  Seva({
    @required this.id,
    @required this.sevaName,
    @required this.startDate,
    @required this.endDate,
    @required this.sevaAmount,
    this.sankalpAmount = 0.00,
    this.yogdanAmount = 0.00,
    this.sankalpFlag = false,
    this.mySankalpAmount = 0.00,
    this.myYogdanAmount = 0.00,
  });
}

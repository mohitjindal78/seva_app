import 'package:flutter/foundation.dart';

class Yogdan {
  final String id;
  final String sevaName; //Description of Seva
  final DateTime endDate; //Date till when seva is valid
  final double sevaAmount; //Amount required for this seva
  final double sankalpAmount; //Total Sankal taken by people
  final double yogdanAmount; //Total amount collected
  final bool
      sankalpFlag; // Whether person logged in has already taken sankalp for this seva

  Yogdan({
    @required this.id,
    @required this.sevaName,
    @required this.endDate,
    @required this.sevaAmount,
    @required this.sankalpAmount,
    @required this.yogdanAmount,
    @required this.sankalpFlag,
  });
}

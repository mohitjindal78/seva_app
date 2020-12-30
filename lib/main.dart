import 'package:flutter/material.dart';
import 'package:seva_app/screens/login_screen.dart';
import 'package:seva_app/screens/landing_screen.dart';
import 'package:seva_app/screens/new_payment.dart';

void main() {
  runApp(SevaApp());
}

class SevaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seva App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        LandingScreen.id: (context) => LandingScreen(),
        NewPayment.id: (context) => NewPayment(),
      },
    );
  }
}

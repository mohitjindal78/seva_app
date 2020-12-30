import 'package:flutter/material.dart';
import 'package:seva_app/screens/landing_screen.dart';
import 'package:seva_app/utilities/constants.dart';
import 'package:seva_app/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your phone number"),
            ), //enter your phone number
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"),
            ), //enter password
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LandingScreen.id);
              },
            ), // Log in button
            //TODO: Sign In Page and Forgot password
          ],
        ),
      ),
    );
  }
}

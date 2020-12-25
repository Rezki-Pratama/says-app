import 'package:flutter/material.dart';
import 'package:says_app/presentation/screens/registration_screen.dart';
import 'package:says_app/presentation/utilities/style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: mediaQuery.width / 20,
          vertical: mediaQuery.width / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Welcome to WhatsApp Clone",
              style: TextStyle(
                fontSize: mediaQuery.width / 18,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: mediaQuery.height / 3,
              width: mediaQuery.width / 1,
              child: Image.asset("assets/brand.png"),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: mediaQuery.width / 25),
                ),
                SizedBox(
                  height: mediaQuery.height / 20,
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(
                      fontSize: mediaQuery.width / 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
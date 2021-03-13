import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sql_lite_app/pages/home_screen.dart';


class WelcomeScreen extends StatelessWidget {
  String routeName = '/welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b1b1b),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color(0xFF2b1b1b),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/air2.png',
              ),

              // width: double.infinity,
              // height: double.infinity,
            ),
            SizedBox(height: 20),
            Text(
              'CLASS A \nCOURSES',
              textAlign: TextAlign.center,
              style: GoogleFonts.exo2(
                  color: Color(0xFFFF5A5F),
                  fontSize: 30,
                  letterSpacing: 6,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            FlatButton(
              height: 60,
              minWidth: 300,
              color: Color(0xFFFF5A5F),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                Navigator.pushNamed(context, Home().routeName);
              },
              child: Text(
                'Continue',
                style: GoogleFonts.exo2(
                    color: Color(0xFF1b1b1b),
                    fontSize: 20,
                    letterSpacing: 3,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

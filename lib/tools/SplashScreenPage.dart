import 'dart:async';

import 'package:almohami/Pages/MainPage.dart';
import 'package:almohami/tools/SkipPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      );
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (context) => new SkipPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(
      new Duration(milliseconds: 5000),
      () {
        checkFirstSeen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SkipPage(),
      photoSize: 80.0,
      loaderColor: Colors.black,
      image: Image.asset("assets/images/icon.png"),
      title: Text("المحامي",
          style: TextStyle(
              color: Color(0xFFFFC400),
              fontSize: 40.0,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold)),
      loadingText: Text(
        "يتم التحميل...",
        style: TextStyle(
          color: Color(0xFFFFC400),
          fontSize: 20.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
      ),
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => print("المحامي"),
    );
  }
}

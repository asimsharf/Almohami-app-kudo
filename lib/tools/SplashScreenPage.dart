import 'package:almohami/tools/SkipPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new SkipPage(),
      photoSize: 80.0,
      loaderColor: Colors.black,
      image: Image.asset("assets/images/icon.png"),
//      gradientBackground: new LinearGradient(
//          colors: [Color(0xFF23AFB1), Color(0xFF23AFB1)],
//          begin: Alignment.topLeft,
//          end: Alignment.bottomRight),
      title: Text("المحامي",
          style: TextStyle(
              color: Color(0xFFFFC400),
              fontSize: 40.0,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold)),
      loadingText: Text("يتم التحميل...",
          style: TextStyle(
            color: Color(0xFFFFC400),
            fontSize: 20.0,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          )),
      styleTextUnderTheLoader: new TextStyle(),
      onClick: () => print("المحامي"),
    );
  }
}

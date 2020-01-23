import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help>
    with SingleTickerProviderStateMixin, TickerProviderStateMixin {
  AnimationController _controllers;

  String result;

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controllers = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المساعدة',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0)),
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 220.0,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("رقم الجوال",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "00966593118811",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الواتساب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "00966547792386",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الموقع الإلكتروني",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "http://almohamigroup.com/",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("البريد الإلكتروني",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "info@almohamigroup.com",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("الدولة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "المملكة العربية السعودية",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("المدينة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF37505D),
                                  fontSize: 14.0)),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "جدة",
                            style: TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile image
          new Positioned(
            top: 120.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: new Center(
                      child: new Stack(
                    children: <Widget>[
                      new Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(120.0),
                              image: new DecorationImage(
                                image: new AssetImage("assets/images/icon.png"),
                                fit: BoxFit.cover,
                              ),
                              color: Color(0xFFFFFF00)),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _chackMakeCall(context),
                color: Color(0xFFFFC400),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.black,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.call)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _chackWhatsAppChat(context),
                color: Color(0xFFFFC400),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.black,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(FontAwesomeIcons.whatsapp)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _chackSendEmail(context),
                color: Color(0xFFFFC400),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.black,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.email)),
              ),
            ),
            SizedBox(width: 3.0),
            new Expanded(
              child: new MaterialButton(
                onPressed: () => _chackLanchWebSite(context),
                color: Color(0xFFFFC400),
                splashColor: Color(0xFFFFFF00),
                textColor: Colors.black,
                elevation: 0.2,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(FontAwesomeIcons.chrome)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _chackMakeCall(context) {
    Alert(
        context: context,
        title: "إجراء مكالمة",
        content: Text(
          "هل تريد إجراء مكالمة",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("tel://00966593118811"),
            color: Color(0xFFFFC400),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _chackSendEmail(context) {
    Alert(
        context: context,
        title: "إرسال بريد إلكتروني",
        content: Text(
          "هل تريد إرسال بريد إلكتروني؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch(
                "mailto://info@almohamigroup.com?subject=طلب المساعدة من التطبيق&body=السلام عليكم ورحمة الله "),
            color: Color(0xFFFFC400),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _chackWhatsAppChat(context) {
    Alert(
        context: context,
        title: "إجراء دردشة واتساب",
        content: Text(
          "هل تريد إجراء دردشة واتساب؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("whatsapp://send?phone=00966593118811"),
            color: Color(0xFFFFC400),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }

  _chackLanchWebSite(context) {
    Alert(
        context: context,
        title: "الذهاب إلى الموقع",
        content: Text(
          "هل تريد الذهاب الى الموقغ؟",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              color: Colors.black,
              fontSize: 20),
        ),
        buttons: [
          DialogButton(
            onPressed: () => launch("http://mohamigroup.com/"),
            color: Color(0xFFFFC400),
            child: Text(
              "موافق",
              style: TextStyle(
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ]).show();
  }
}

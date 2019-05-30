import 'package:almohami/Pages/CallUs.dart';
import 'package:almohami/Pages/Help.dart';
import 'package:almohami/Pages/Lawyers.dart';
import 'package:almohami/Pages/about.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('المحامي',
            style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black)),
      ),
      drawer: new Drawer(
          elevation: 3.5,
          child: Container(
            alignment: Alignment.center,
//            decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: new AssetImage("assets/images/icon.jpg"),
//                fit: BoxFit.cover,
//              ),
//            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text("المحامي",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      )),
                  accountEmail: new Text("أطلب محامي الأن بضغطة زر",
                      style: TextStyle(
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      )),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(50.0),
                          image: new DecorationImage(
                            image: new AssetImage("assets/images/icon.png"),
                            fit: BoxFit.cover,
                          ),
                          color: Color(0xFFFFF6E8)),
                    ),
                  ),
                ),
                new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.black,
                      child: new Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    title: new Text("الرئيسية",
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                    onTap: () {
                      Navigator.pop(context, "الرئيسية");
                    }),
                new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.black,
                      child: new Icon(
                        FontAwesomeIcons.envelope,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    title: new Text("راسلنا",
                        style: TextStyle(
                            fontFamily: ArabicFonts.Cairo,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CallUs(),
                        ),
                      );
                    }),
                new ListTile(
                  leading: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: new Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: new Text("الموقع",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                  onTap: () => launch("http://almohamigroup.com/"),
                ),
                new Divider(
                  color: Colors.black,
                ),
                new ListTile(
                  trailing: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: new Icon(
                      Icons.live_help,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: new Text("المساعدة",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Help(),
                      ),
                    );
                  },
                ),
                new ListTile(
                  trailing: new CircleAvatar(
                    backgroundColor: Colors.black,
                    child: new Icon(
                      FontAwesomeIcons.infoCircle,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  title: new Text("حول التطبيق",
                      style: TextStyle(
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => About(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            GestureDetector(
              child:
                  makeDashboardItem("قائمة المحامين", Icons.supervisor_account),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Lawyers(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem("إتصل بنا", Icons.call),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CallUs(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem("المساعدة", Icons.help),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Help(),
                  ),
                );
              },
            ),
            GestureDetector(
              child: makeDashboardItem("عن التطبيق", Icons.live_help),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFFFC400)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
                  child: Icon(
                icon,
                size: 30.0,
                color: Colors.black,
              )),
              SizedBox(height: 18.0),
              new Center(
                child: new Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        ));
  }
}

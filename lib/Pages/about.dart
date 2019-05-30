//تطبيق يوفر لك الجهد والمال وفرصة الالتقاء مامهر
//القانونين الذين يقدمون لك افضل الخدمات في
//مجال الاستشارات القانونية
//والمحاماة والمرافعات بكافة انواعها
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "حول التطبيق",
          style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "تطبيق المحامي",
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage("assets/images/icon.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "لماذا تطبيق المحامي \nيوفر لك تطبيق المحامي قاعدة بيانات شاملة عن كل المحامين و مقدمي الخدمات القانونية حيث يمكنك عن طريق التطبيق الحصول علي بيانات محامي معين من حيث ارقام التواصل ومكان المكتب والقضايا المختص بها كل محامي. كما يوفر لك التطبيق آلية البحث عن محامي بكل سهولة باستخدام محرك البحث. تطبيق المحامي يوفر لك المال و الجهد في الحصول علي أفضل الخدمات القانونية دون عناء \n خدمة الوصول لأقرب محامي اليك 100%\n يوفر لمكاتب المحاماه خدمات التسويق والوصول للجمهور 100%\n توفير أكبر عدد من المحامين والإستشارين في منصه واحدة 100%",
                style: TextStyle(
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:almohami/Pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:intro_slider/intro_slider.dart';

class SkipPage extends StatefulWidget {
  @override
  _SkipPageState createState() => _SkipPageState();
}

class _SkipPageState extends State<SkipPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "تطبيق المحامي",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            "يمكنك الآن حسم أمورك القانونية الخاصة بك –بكل يسر وسهولة-مع تطبيق المحامي. تطبيق محاميك هو دليل المحامين في المملكة العربية السعودية بحيث يمكنك قراءة المزيد من المعلومات عن كل محامي في هذا",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/icon.png",
        heightImage: 200.0,
        widthImage: 200.0,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        title: "مميزات التطبيق",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            "إمكانية البحث عن محامين بحسب الموقع، أو تصنيف المحامي، أو جنس المحامي، أو نوع الخدمة المطلوبة. يمكنك تصفح الملفات الشخصية المفصلة للمحامين للتوصل للاختيار الأنسب لك. يمكنك التواصل مباشرة ",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/icon.png",
        heightImage: 200.0,
        widthImage: 200.0,
        backgroundColor: Colors.white,
      ),
    );

    slides.add(
      new Slide(
        title: "لماذا تطبيق المحامي",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        description:
            "يمكنك عن طريق التطبيق الحصول علي بيانات محامي معين من حيث ارقام التواصل ومكان المكتب والقضايا المختص بها كل محامي",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
          fontFamily: ArabicFonts.Cairo,
          package: 'google_fonts_arabic',
        ),
        pathImage: "assets/images/icon.png",
        heightImage: 200.0,
        widthImage: 200.0,
        backgroundColor: Colors.white,
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(),
      ),
    );
  }

  void onSkipPress() {
    // TODO: go to next screen
    onDonePress();
  }

  Widget renderNextBtn() {
    return Text(
      "التالي",
      style: TextStyle(
        color: Color(0xFFFFC400),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "تم",
      style: TextStyle(
        color: Color(0xFFFFC400),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      "تخطي",
      style: TextStyle(
        color: Color(0xFFFFC400),
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        fontFamily: ArabicFonts.Cairo,
        package: 'google_fonts_arabic',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      highlightColorSkipBtn: Color(0xFFFFFF00),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      highlightColorDoneBtn: Color(0xFFFFFF00),
      // Dot indicator
      colorDot: Color(0xFFFFC400),
      colorActiveDot: Color(0xFF000000),
      sizeDot: 13.0,
    );
  }
}

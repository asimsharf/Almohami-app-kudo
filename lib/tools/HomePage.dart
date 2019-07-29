import 'package:almohami/language/scope_model_wrapper.dart';
import 'package:almohami/tools/SplashScreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => MaterialApp(
              locale: model.appLocal,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale('ar', ''), // Arabic
                const Locale('en', ''), // English
              ],
              debugShowCheckedModeBanner: false,
              title: "المحامي",
              theme: Theme.of(context).copyWith(
                  accentIconTheme: Theme.of(context)
                      .accentIconTheme
                      .copyWith(color: Colors.black),
                  accentColor: Color(0xFFFFC400),
                  primaryColor: Color(0xFFFFC400),
                  primaryIconTheme: Theme.of(context)
                      .primaryIconTheme
                      .copyWith(color: Colors.black),
                  primaryTextTheme: Theme.of(context)
                      .primaryTextTheme
                      .apply(bodyColor: Colors.black)),
              home: new SplashScreenPage(),
            ));
  }
}

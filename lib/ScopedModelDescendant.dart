import 'package:almohami/language/scope_model_wrapper.dart';
import 'package:almohami/language/translation_strings.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new ScopedModelDescendant<AppModel>(
                builder: (context, child, model) => MaterialButton(
                      onPressed: () {
                        model.changeDirection();
                      },
                      height: 20.0,
                      color: const Color.fromRGBO(119, 31, 17, 1.0),
                      child: new Text(
                        Translations.of(context).language,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

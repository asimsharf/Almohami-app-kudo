import 'dart:async';

import 'package:almohami/language/translation_strings.dart';
import 'package:flutter/material.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String translate(BuildContext context, String text) =>
    AppLocalizations.of(context)!.translate(text);

class AppLocalizations {
  late Locale locale;
  late Map<String, String> localizedStrings;

  AppLocalizations(this.locale);

  Future<bool> load({Map<String, dynamic>? strings}) async {
    Map<String, dynamic>? jsonMap = strings;
    String jsonString;
    if (jsonMap == null) {
      if (kIsWeb) {
        jsonString =
            await rootBundle.loadString('lang/${locale.languageCode}.json');
      } else {
        jsonString =
            await rootBundle.loadString('lang/${locale.languageCode}.json');
      }
      jsonMap = json.decode(jsonString);
    }
    // Load the language JSON file from the "lang" folder
    localizedStrings = jsonMap!.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /// return the translation of the key.
  String translate(String key) {
    return localizedStrings[key] ?? '';
  }

  String getLanguageCode() {
    return locale.languageCode;
  }

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    // Include all the supported language codes here
    return ['en', 'hu'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

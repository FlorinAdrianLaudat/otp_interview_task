import 'package:flutter/material.dart';

import 'features/input_text_feature/presentation/pages/input_text_page.dart';
import 'localization/app_localizations.dart';

class OtpApp extends StatelessWidget {
  const OtpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter OTP Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hu', 'HU'),
      ],
      localizationsDelegates: [
        // class which loads the translations from JSON files
        AppLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale language is supported
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case) .
        return supportedLocales.first;
      },
      home: const InputTextPage(),
    );
  }
}

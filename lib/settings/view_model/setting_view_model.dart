import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languegeCode = 'en';

  chaneLanguage(String selectedLanguage) {
    languegeCode = selectedLanguage;
    notifyListeners();
  }
}

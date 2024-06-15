import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLocale = "en";
  ThemeMode currentMode = ThemeMode.system;
  SharedPreferences? _preferences;
  final String _themeKey = "theme";
  final String _langKey = "lang";

  bool isArEnabled() => currentLocale == "ar";

  bool isDarkMode() => currentMode == ThemeMode.dark;

  void setCurrentMode(ThemeMode newThemeMode) {
    currentMode = newThemeMode;
    notifyListeners();
    saveTheme(newThemeMode);
  }

  void setCurrentLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
    saveLang(newLocale);
  }

  String? getTheme() {
    return _preferences!.getString(_themeKey);
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String themeValue = (themeMode == ThemeMode.light ? "light" : "dark");

    await _preferences!.setString(_themeKey, themeValue);
  }

  String? getLang() {
    return _preferences!.getString(_langKey);
  }

  Future<void> saveLang(String newLang) async {
    await _preferences!.setString(_langKey, newLang);
  }

  Future<void> loadSettingsConfig() async {
    _preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? lang = getLang();

    if (lang != null) {
      currentLocale = lang;
    }

    if (themeMode != null) {
      currentMode = (themeMode == "light" ? ThemeMode.light : ThemeMode.dark);
    }
  }
}

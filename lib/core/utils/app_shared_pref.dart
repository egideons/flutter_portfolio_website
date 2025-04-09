import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localKey = "app_locale";
  static Future<void> setAppLocale(String locale) async {
    final sharedPref = await SharedPreferences.getInstance();

    sharedPref.setString(localKey, locale);
  }

  static Future<String> getAppLocale() async {
    final sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getString(localKey) ?? "en";
  }

  static const themeKey = "app_theme";
  static Future<void> setAppTheme(String theme) async {
    final sharedPref = await SharedPreferences.getInstance();

    sharedPref.setString(themeKey, theme);
  }

  static Future<ThemeMode> getAppTheme() async {
    final sharedPref = await SharedPreferences.getInstance();

    return sharedPref.getString(themeKey) == "light"
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}

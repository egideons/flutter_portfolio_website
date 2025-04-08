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
}

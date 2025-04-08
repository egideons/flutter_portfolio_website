import 'dart:async';

import 'package:flutter_portfolio_website/core/utils/app_shared_pref.dart';
import 'package:riverpod/riverpod.dart';

class AppLocaleController extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSharedPref.setAppLocale(newLocale);
    update((state) => newLocale);
  }
}

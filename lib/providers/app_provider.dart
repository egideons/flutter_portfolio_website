import 'package:flutter_portfolio_website/controllers/app_locale_controller.dart';
import 'package:riverpod/riverpod.dart';

final appLocaleProvider = AsyncNotifierProvider<AppLocaleController, String>(
  AppLocaleController.new,
);

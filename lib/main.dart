import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portfolio_website/controllers/app_locale_controller.dart';
import 'package:flutter_portfolio_website/controllers/app_theme_controller.dart';
import 'package:flutter_portfolio_website/core/theme/app_theme.dart';
import 'package:flutter_portfolio_website/views/home/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp(
      title: 'Gideon | Dart',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(fontFamily: _fontFamily(locale.value)).light,
      darkTheme: AppTheme(fontFamily: _fontFamily(locale.value)).dark,
      themeMode: theme.value,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      locale: Locale(locale.value ?? "en"),
      home: Scaffold(
        body: Home(),
      ),
    );
  }

  String _fontFamily(String? locale) {
    return (locale ?? "en") == "en" ? "Poppins" : "Montserrat";
  }
}

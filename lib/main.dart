import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portfolio_website/controllers/app_locale_controller.dart';
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
    return MaterialApp(
      title: 'Gideon | Dart',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.dark,
      themeMode: ThemeMode.dark,
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
}

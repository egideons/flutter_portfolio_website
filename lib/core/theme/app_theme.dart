import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: AppColors.primaryColor,
          surface: AppColors.darkBackgroundColor,
          onSurface: AppColors.gray[100]!,
        ),
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        appBarTheme: AppBarTheme(color: AppColors.gray[900]),
      );
}

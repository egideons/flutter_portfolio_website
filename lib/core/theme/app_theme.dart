// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/theme/app_colors.dart';
import 'package:flutter_portfolio_website/core/utils/app_size.dart';

class AppTheme {
  final String fontFamily;
  AppTheme({
    required this.fontFamily,
  });

  ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        surface: AppColors.darkBackgroundColor,
        outline: AppColors.gray[800]!,
        outlineVariant: AppColors.gray[700]!,
        onSurface: AppColors.gray[300]!,
        onSurfaceVariant: AppColors.gray[400]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: _darkElevatedButtonStyle(fontFamily)),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: _darkOutlinedButtonStyle(fontFamily)),
      appBarTheme: AppBarTheme(color: AppColors.gray[900]!.withOpacity(.3)),
    );
  }

  ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        surface: AppColors.gray[200]!,
        outline: AppColors.gray[300]!,
        outlineVariant: AppColors.gray[400]!,
        onSurface: AppColors.gray[700]!,
        onSurfaceVariant: AppColors.gray[600]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.gray[100]!,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: _lightElevatedButtonStyle(fontFamily)),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: _lightOutlinedButtonStyle(fontFamily)),
      appBarTheme: AppBarTheme(color: AppColors.gray[100]!.withOpacity(.3)),
    );
  }

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required ElevatedButtonThemeData elevatedButtonTheme,
    required OutlinedButtonThemeData outlinedButtonTheme,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
            horizontal: Insets.xl,
            vertical: 10,
          )),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlinedButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: Insets.xl,
              vertical: 10,
            ),
          ),
        ),
      ),
    );
  }

  final _primaryButtonStates = WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return const Color(0xFF561895).withOpacity(.7);
      }
      return AppColors.primaryColor;
    },
  );
  final _outlinedButtonStates = WidgetStateProperty.resolveWith(
    (states) {
      if (states.contains(WidgetState.hovered) ||
          states.contains(WidgetState.pressed)) {
        return BorderSide(
          color: const Color(0xFF561895).withOpacity(.7),
        );
      }
      return BorderSide(
        color: const Color(0xFF561895).withOpacity(.7),
      );
    },
  );

  ButtonStyle _darkElevatedButtonStyle(String fontFamily) => ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
        alignment: Alignment.center,
        elevation: WidgetStatePropertyAll(20),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.gray[100],
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        enableFeedback: true,
        overlayColor: WidgetStatePropertyAll(AppColors.gray[800]!),
        animationDuration: Duration(milliseconds: 400),
        mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
          return SystemMouseCursors.click;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
        ),
        // textStyle:
      );

  ButtonStyle _darkOutlinedButtonStyle(String fontFamily) => ButtonStyle(
        // backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
        alignment: Alignment.center,
        elevation: WidgetStatePropertyAll(20),
        enableFeedback: true,
        animationDuration: Duration(milliseconds: 400),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.gray[100],
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),

        mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
          return SystemMouseCursors.click;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
        ),
        // textStyle:
      );

  ButtonStyle _lightElevatedButtonStyle(String fontFamily) => ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
        alignment: Alignment.center,
        elevation: WidgetStatePropertyAll(20),
        enableFeedback: true,
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.gray[100],
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        overlayColor: WidgetStatePropertyAll(AppColors.gray[300]!),
        animationDuration: Duration(milliseconds: 400),
        mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
          return SystemMouseCursors.click;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
        ),
        // textStyle:
      );

  ButtonStyle _lightOutlinedButtonStyle(String fontFamily) => ButtonStyle(
        // backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
        alignment: Alignment.center,
        elevation: WidgetStatePropertyAll(20),
        enableFeedback: true,
        animationDuration: Duration(milliseconds: 400),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.gray[800],
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
          return SystemMouseCursors.click;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
        ),
        // textStyle:
      );
}

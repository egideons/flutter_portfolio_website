import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/theme/app_colors.dart';
import 'package:flutter_portfolio_website/core/utils/app_size.dart';

class AppTheme {
  ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
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
          ElevatedButtonThemeData(style: _darkElevatedButtonStyle),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: _darkOutlinedButtonStyle),
      appBarTheme: AppBarTheme(color: AppColors.gray[900]!.withOpacity(.3)),
    );
  }

  ThemeData get light {
    return ThemeData(
      useMaterial3: true,
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
          ElevatedButtonThemeData(style: _lightElevatedButtonStyle),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: _lightOutlinedButtonStyle),
      appBarTheme: AppBarTheme(color: AppColors.gray[100]!.withOpacity(.3)),
    );
  }

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      // fontFamily: fontFamily,
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
          textStyle: elevatedButtonTextStyle,
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
          textStyle: outlinedButtonTextStyle,
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
          width: 2,
          style: BorderStyle.solid,
        );
      }
      return BorderSide(
        color: AppColors.primaryColor,
        width: 2,
        style: BorderStyle.solid,
      );
    },
  );

  final _lightElevatedButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
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
  final _darkElevatedButtonStyle = ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
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

  final _lightOutlinedButtonStyle = ButtonStyle(
    // backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
    animationDuration: Duration(milliseconds: 400),
    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );
  final _darkOutlinedButtonStyle = ButtonStyle(
    // backgroundColor: WidgetStatePropertyAll(Color(0xFF561895).withOpacity(.7)),
    alignment: Alignment.center,
    elevation: WidgetStatePropertyAll(20),
    enableFeedback: true,
    animationDuration: Duration(milliseconds: 400),
    mouseCursor: WidgetStateMouseCursor.resolveWith((states) {
      return SystemMouseCursors.click;
    }),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: Insets.med, vertical: 4),
    ),
    // textStyle:
  );
}

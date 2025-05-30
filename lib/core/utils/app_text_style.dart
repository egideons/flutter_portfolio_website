import 'package:flutter/material.dart';

abstract class AppTextStyle {
  TextStyle get titleSmBold;
  TextStyle get bodyMdMedium;
  TextStyle get titleMdBold;
  TextStyle get titleLgBold;
  TextStyle get titleXLgBold;
  TextStyle get titleXXLgBold;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
}

class SmallTextStyles extends AppTextStyle {
  @override
  TextStyle get bodyLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 14,
      );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );

  @override
  TextStyle get titleLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 24,
      );
  @override
  TextStyle get titleXLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 48,
      );
  @override
  TextStyle get titleXXLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 64,
      );

  @override
  TextStyle get titleMdMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );

  @override
  TextStyle get titleMdBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 24,
      );
  @override
  TextStyle get titleSmBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 16,
      );
}

class LargeTextStyles extends AppTextStyle {
  @override
  TextStyle get bodyLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 16,
      );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  @override
  TextStyle get titleXXLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 72,
      );
  @override
  TextStyle get titleXLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 64,
      );

  @override
  TextStyle get titleLgBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 40,
      );

  @override
  TextStyle get titleMdBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 24,
      );
  @override
  TextStyle get titleMdMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
      );

  @override
  TextStyle get titleSmBold => const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 16,
      );
}

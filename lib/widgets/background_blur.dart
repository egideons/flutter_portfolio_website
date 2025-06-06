// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
      left: -(context.width / 2 / 2),
      top: (-(context.width / 2 / 2)) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.height / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 200,
              spreadRadius: 100,
              color: isDarkMode
                  ? context.colorScheme.primary.withOpacity(.4)
                  : context.colorScheme.primary.withOpacity(.16),
            ),
          ],
        ),
      ),
    );
  }
}

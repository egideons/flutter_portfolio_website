import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';

extension Alert on BuildContext {
  alert(String message) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(this).textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
          backgroundColor: colorScheme.primary,
        ),
      );
}

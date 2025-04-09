import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/theme/app_colors.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  const PrimaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.gray[100],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String title;
  const OutlineButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: SEOText(
        title,
        textStyle: TextStyle(
          color: context.colorScheme.onSurface,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_images.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: context.isTablet ? .7 : .9,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(250)),
        child: Image.asset(AppImages.me, fit: BoxFit.cover),
      ),
    );
  }
}

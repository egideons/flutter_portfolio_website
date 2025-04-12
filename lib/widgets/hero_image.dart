import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/animated_dialog.dart';
import 'package:flutter_portfolio_website/core/utils/app_images.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showHeroImageDialog(context);
      },
      child: AspectRatio(
        aspectRatio: context.isTablet ? .9 : 1,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(250)),
          child: Image.asset(AppImages.me, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

Future<void> showHeroImageDialog(BuildContext context) async {
  showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    child: const HeroImageDialog(),
  );
}

class HeroImageDialog extends StatelessWidget {
  const HeroImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: Image.asset(AppImages.me, fit: BoxFit.cover),
      ),
    );
  }
}

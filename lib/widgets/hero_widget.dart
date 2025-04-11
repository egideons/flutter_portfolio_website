import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_images.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/constants.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/hero_buttons.dart';
import 'package:flutter_portfolio_website/widgets/hero_image.dart';
import 'package:flutter_portfolio_website/widgets/hero_texts.dart';
import 'package:gap/gap.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.med),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(250)),
                child: Image.asset(
                  AppImages.flutter,
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                ),
              ),
              Text(context.texts.poweredByFlutter),
            ],
          ).fadeInDownBig(curve: Curves.easeIn),
          10.toHeight,
          context.isDesktopOrTablet ? _LargeHero() : _SmallHero(),
        ],
      ),
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 140),
          child: HeroImage().fadeInDownBig(curve: Curves.easeIn),
        ),
        Gap(Insets.xl),
        HeroTexts().fadeInUpBig(curve: Curves.easeIn),
        Gap(Insets.xxl),
        SmallHeroButtons().fadeInUpBig(curve: Curves.easeIn),
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: HeroImage().fadeInLeft(curve: Curves.easeIn)),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              HeroTexts(),
              Gap(Insets.xxl),
              LargeHeroButtons(),
            ],
          ).fadeInRight(curve: Curves.easeIn),
        ),
      ],
    );
  }
}

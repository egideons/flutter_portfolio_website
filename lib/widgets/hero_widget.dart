import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_images.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';
import 'package:flutter_portfolio_website/widgets/hero_buttons.dart';
import 'package:flutter_portfolio_website/widgets/hero_image.dart';
import 'package:flutter_portfolio_website/widgets/hero_texts.dart';
import 'package:gap/gap.dart';
import 'package:smooth_counter/smooth_counter.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.xxxl),
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
              SEOText(context.texts.poweredByFlutter),
            ],
          ).fadeInDownBig(curve: Curves.easeIn),
          context.isDesktopOrTablet ? _LargeHero() : _SmallHero(),
        ],
      ),
    );
  }
}

class _HeroWorkSummary extends StatefulWidget {
  const _HeroWorkSummary();

  @override
  State<_HeroWorkSummary> createState() => __HeroWorkSummaryState();
}

class __HeroWorkSummaryState extends State<_HeroWorkSummary> {
  final _yearsOfWorkExperience = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );
  final _projectsWorkedOn = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );
  final _companiesWorkedAt = SmoothCounterController(
    duration: const Duration(milliseconds: 1000),
  );

  @override
  void initState() {
    _incrementCounter();
    super.initState();
  }

  @override
  void dispose() {
    _yearsOfWorkExperience.dispose();
    super.dispose();
  }

  void _incrementCounter() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      _yearsOfWorkExperience.count += 5;
      _projectsWorkedOn.count += 12;
      _companiesWorkedAt.count += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: _rowItem(
            controller: _yearsOfWorkExperience,
            hasSuffix: true,
            subtitle: context.texts.yearsOfWorkExperience,
          ),
        ),
        Expanded(
          child: _rowItem(
            controller: _projectsWorkedOn,
            hasSuffix: true,
            subtitle: context.texts.projectsWorkedOn,
          ),
        ),
        Expanded(
          child: _rowItem(
            controller: _companiesWorkedAt,
            hasSuffix: false,
            subtitle: context.texts.companiesWorkedAt,
          ),
        ),
      ],
    );
  }

  _rowItem({
    SmoothCounterController? controller,
    String? subtitle,
    bool? hasSuffix,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SmoothCounter(
            controller: controller,
            suffix: hasSuffix == true ? "+" : "",
            textStyle: context.textStyle.titleLgBold,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
          ),
          SEOText(
            subtitle ?? "",
            textAlign: TextAlign.center,
            textStyle: context.textStyle.titleMdMedium,
          ),
        ],
      );
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
        Gap(Insets.xl),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width),
          child: _HeroWorkSummary(),
        ),
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
        Gap(Insets.xl),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              HeroTexts(),
              Gap(Insets.xxl),
              LargeHeroButtons(),
              Gap(Insets.xl),
              _HeroWorkSummary(),
            ],
          ).fadeInRight(curve: Curves.easeIn),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/styled_button.dart';
import 'package:gap/gap.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(
          onPressed: () {},
          title: context.texts.downloadResume,
        ),
        Gap(Insets.lg),
        OutlineButton(
          onPressed: () {},
          title: context.texts.contactMe,
        ),
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            onPressed: () {},
            title: context.texts.downloadResume,
          ),
        ),
        Gap(Insets.lg),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(
            onPressed: () {},
            title: context.texts.contactMe,
          ),
        ),
      ],
    );
  }
}

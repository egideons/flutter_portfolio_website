import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "Change Language",
      // child: Icon(Icons.),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: PopupLanguageSwitchItem(language: "English", icon: icon),
          ),
          PopupMenuItem(
            child: Text("Spanish"),
          ),
        ];
      },
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem(
      {super.key, required this.language, required this.icon});

  final String language;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
        ),
        const Gap(8),
        SEOText(language),
      ],
    );
  }
}

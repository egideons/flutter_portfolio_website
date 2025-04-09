import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/controllers/app_locale_controller.dart';
import 'package:flutter_portfolio_website/core/utils/app_icon.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider);

    return PopupMenuButton<int>(
      tooltip: "Change Language",
      initialValue: locale.value == "en" ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          // set locale to English
          ref.read(appLocaleControllerProvider.notifier).changeLocale("en");
        } else {
          // set locale to Spanish
          ref.read(appLocaleControllerProvider.notifier).changeLocale("es");
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child:
                PopupLanguageSwitchItem(language: "English", icon: AppIcon.us),
          ),
          PopupMenuItem(
            value: 1,
            child:
                PopupLanguageSwitchItem(language: "Español", icon: AppIcon.es),
          ),
        ];
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 4),
          SEOText(
            locale.value == "es" ? "Es" : "En",
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });

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

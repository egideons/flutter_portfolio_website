import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/controllers/app_theme_controller.dart';
import 'package:flutter_portfolio_website/core/utils/app_menu_list.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/app_bar_drawer_icon.dart';
import 'package:flutter_portfolio_website/widgets/drawer_menu.dart';
import 'package:flutter_portfolio_website/widgets/language_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends StatelessWidget {
  final bool hasScrolledDown;
  const MyAppBar({super.key, required this.hasScrolledDown});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: context.insets.appBarHeight,
          color: hasScrolledDown
              ? isDarkMode
                  ? context.theme.primaryColor
                  : context.theme.scaffoldBackgroundColor
              : context.theme.appBarTheme.backgroundColor,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Insets.maxWidth),
            child: Row(
              children: [
                MyLogo(),
                Spacer(),
                if (context.isDesktop) LargeAppBarMenu(),
                Spacer(),
                LanguageSwitch(),
                ThemeToggle(),
                if (!context.isDesktop) AppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      mouseCursor: SystemMouseCursors.click,
      child: Text(
        context.texts.egideonchuks,
        style: context.textStyle.titleLgBold,
      ),
    );
  }
}

class LargeAppBarMenu extends StatelessWidget {
  const LargeAppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: AppMenuList.getItems(context)
          .map(
            (e) => LargeAppBarMenuItem(
              text: e.title,
              isSelected: true,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class SmallAppBarMenu extends StatelessWidget {
  const SmallAppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppMenuList.getItems(context)
          .map(
            (e) => LargeAppBarMenuItem(
              text: e.title,
              isSelected: true,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Insets.med, vertical: Insets.xs),
        child: Text(
          text,
          style: context.textStyle.bodyLgMedium,
        ),
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(appThemeControllerProvider);
    return Switch.adaptive(
      value: themeState.value == ThemeMode.dark,
      onChanged: (value) {
        ref
            .read(appThemeControllerProvider.notifier)
            .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_menu_list.dart';
import 'package:flutter_portfolio_website/core/utils/app_size.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/app_bar_drawer_icon.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: context.insets.appBarHeight,
      color: context.theme.appBarTheme.backgroundColor,
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
            LanguageToggle(),
            ThemeToggle(),
            if (!context.isDesktop) AppBarDrawerIcon(),
          ],
        ),
      ),
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
        "egideonchuks",
        style: context.textStyle.titleLgBold,
      ),
    );
  }
}

class LargeAppBarMenu extends StatelessWidget {
  const LargeAppBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: false,
      onChanged: (value) {},
    );
  }
}

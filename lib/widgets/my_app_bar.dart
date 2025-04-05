import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      elevation: 20,
      title: Row(
        children: [
          MyLogo(),
          Spacer(),
          AppMenus(),
          Spacer(),
          LanguageToggle(),
          ThemeToggle(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final assetPath = "assets/icons/logo.svg";
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      mouseCursor: SystemMouseCursors.click,
      child: SvgPicture.asset(
        assetPath,
        semanticsLabel: 'G Logo',
        height: 40,
        width: 40,
      ),
    );
  }
}

class AppMenus extends StatelessWidget {
  const AppMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Home"),
        Text("Home"),
        Text("Home"),
        Text("Home"),
        Text("Home"),
      ],
    );
  }
}

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text("English"),
          ),
          PopupMenuItem(
            child: Text("Spanish"),
          ),
        ];
      },
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

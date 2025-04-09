import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_routes.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.texts.home, path: AppRoutes.home),
      AppMenu(title: context.texts.aboutMe, path: AppRoutes.aboutMe),
      AppMenu(title: context.texts.skills, path: AppRoutes.skills),
      // AppMenu(title: context.texts.portfolio, path: AppRoutes.portfolio),
      AppMenu(title: context.texts.contactMe, path: AppRoutes.contactMe),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}

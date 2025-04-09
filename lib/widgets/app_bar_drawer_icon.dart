import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/drawer_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  bool isOpen = false;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (!isOpen) {
            controller.forward();
            ref.read(drawerMenuControllerProvider.notifier).open();
          } else {
            controller.reverse();
            ref.read(drawerMenuControllerProvider.notifier).close();
          }
          isOpen = !isOpen;
        });
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }
}

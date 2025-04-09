// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/my_app_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 200),
  );
  late final _animation = Tween<Offset>(
    begin: Offset(0, -1),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.easeIn),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      drawerMenuControllerProvider,
      (previous, next) {
        if (next.value == true) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.surface.withOpacity(.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: SmallAppBarMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }

  open() {
    update((state) => true);
  }

  close() {
    update((state) => false);
  }
}

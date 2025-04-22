// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:gap/gap.dart';

const expLen = 6;

class ExperiencesBody extends StatelessWidget {
  const ExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopExperiencesBody();
  }
}

class DesktopExperiencesBody extends StatelessWidget {
  const DesktopExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: expLen * 150,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withOpacity(0),
                    context.colorScheme.primary,
                    context.colorScheme.primary.withOpacity(0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          for (int i = 0; i < expLen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * 150,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(),
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }
}

const expWidth = 300.0;
const expHeight = 230.0;

class ExperienceItem extends StatefulWidget {
  const ExperienceItem({super.key});

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  double _elevation = 0;

// Your color constants
  static const primaryColor = Color(0xff561895);
  static const darkBackgroundColor = Color(0xff110D12);
  static const lightBackgroundColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor =
        isDarkMode ? darkBackgroundColor : lightBackgroundColor;
    return MouseRegion(
      onEnter: (_) => setState(() => _elevation = 50),
      onExit: (_) => setState(() => _elevation = 0),
      onHover: (event) => setState(() => _elevation = 50),
      cursor: SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: expWidth,
        height: expHeight,
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [surfaceColor, primaryColor.withOpacity(.2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _elevation > 0
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(.4),
                    blurRadius: 40,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                "Experience Title",
                style: context.textStyle.bodyLgBold.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
              Text(
                "Name of Company",
                style: context.textStyle.bodyLgBold.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    _ExperienceDescriptionItem(),
                    _ExperienceDescriptionItem(),
                    _ExperienceDescriptionItem(),
                    _ExperienceDescriptionItem(),
                    _ExperienceDescriptionItem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  const _ExperienceDescriptionItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onSurface,
          ),
        ),
        const Gap(6),
        Text(
          "Description item",
          style: context.textStyle.bodyLgBold.copyWith(
            color: context.colorScheme.onSurface,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';
import 'package:gap/gap.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class ProfessionCardItem extends StatefulWidget {
  final String imagePath, title;
  const ProfessionCardItem(
      {super.key, required this.imagePath, required this.title});

  @override
  State<ProfessionCardItem> createState() => _ProfessionCardItemState();
}

class _ProfessionCardItemState extends State<ProfessionCardItem> {
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
          child: AspectRatio(
            aspectRatio: .7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 2.8,
                  child: ClipRRect(
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Gap(24),
                SEOText(
                  widget.title,
                  textAlign: TextAlign.center,
                  textStyle: context.textStyle.titleMdBold
                      .copyWith(color: context.colorScheme.onSurface),
                  textRendererStyle: TextRendererStyle.header1,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

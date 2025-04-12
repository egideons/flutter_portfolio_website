import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/core/utils/seo_text.dart';
import 'package:gap/gap.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:typewrite_text/typewrite_text.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SEOText(
          context.texts.myFullName,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textStyle: context.textStyle.titleLgBold.copyWith(
            color: context.colorScheme.onSurface,
          ),
          textRendererStyle: TextRendererStyle.header1,
        ),
        Gap(Insets.sm),
        TypewriteText(
          linesOfText: [
            "${context.texts.leader}.",
            "${context.texts.founderEduralabs}.",
            "${context.texts.mobileAppDeveloper}.",
            "${context.texts.frontendWebDeveloper}.",
            "${context.texts.graphicDesigner}.",
          ],
          cursorSymbol: "|",
          cursorColor: context.colorScheme.primary,
          cursorBlinkingDuration: Duration(milliseconds: 800),
          beforeAnimationDuration: Duration(milliseconds: 400),
          afterAnimationDuration: Duration(milliseconds: 400),
          infiniteLoop: true,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textStyle: context.textStyle.titleLgBold
              .copyWith(color: context.colorScheme.primary),
        ),
        Gap(Insets.lg),
        SEOText(
          context.texts.professionalSummary,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textStyle: context.textStyle.bodyLgMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
      ],
    );
  }
}

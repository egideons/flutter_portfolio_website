import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/app_images.dart';
import 'package:flutter_portfolio_website/core/utils/app_sizing.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/profession_card_item.dart';

class ProfessionsList extends StatelessWidget {
  const ProfessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        context.isDesktopOrTablet
            ? _ProfessionListDesktopOrTabletView()
            : _ProfessionListMobileView(),
      ],
    );
  }
}

class _ProfessionListDesktopOrTabletView extends StatelessWidget {
  const _ProfessionListDesktopOrTabletView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        spacing: Insets.xl,
        children: [
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.leader,
              imagePath: AppImages.leader,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.mobileAppDeveloper,
              imagePath: AppImages.mobile,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.frontendWebDeveloper,
              imagePath: AppImages.web,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.graphicDesigner,
              imagePath: AppImages.designer,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfessionListMobileView extends StatelessWidget {
  const _ProfessionListMobileView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        spacing: Insets.xl,
        children: [
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.leader,
              imagePath: AppImages.leader,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.mobileAppDeveloper,
              imagePath: AppImages.mobile,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.frontendWebDeveloper,
              imagePath: AppImages.web,
            ),
          ),
          Expanded(
            child: ProfessionCardItem(
              title: context.texts.graphicDesigner,
              imagePath: AppImages.designer,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/core/utils/extensions.dart';
import 'package:flutter_portfolio_website/widgets/background_blur.dart';
import 'package:flutter_portfolio_website/widgets/hero_widget.dart';
import 'package:flutter_portfolio_website/widgets/my_app_bar.dart';
import 'package:flutter_portfolio_website/widgets/professions_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

//================ Controllers =================\\
  var scrollController = ScrollController();

//================ Booleans =================\\
  var scrollToTopBtnVisible = false;

//================ Scroll Listener =================//
  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 150) {
      setState(() {
        scrollToTopBtnVisible = true;
      });
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 150) {
      setState(() {
        scrollToTopBtnVisible = false;
      });
    }
  }

  //================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: scrollToTopBtnVisible
          ? FloatingActionButton.small(
              onPressed: scrollToTop,
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.inverseSurface,
              child: const Icon(Icons.keyboard_arrow_up),
            ).fadeInUp(curve: Curves.easeInOut)
          : const SizedBox(),
      body: Stack(
        children: [
          BackgroundBlur(),
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                HeroWidget(),
                ProfessionsList(),
              ],
            ),
          ),
          MyAppBar(),
        ],
      ),
    );
  }
}

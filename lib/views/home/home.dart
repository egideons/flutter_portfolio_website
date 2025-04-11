import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/background_blur.dart';
import 'package:flutter_portfolio_website/widgets/hero_widget.dart';
import 'package:flutter_portfolio_website/widgets/my_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundBlur(),
          HeroWidget(),
          MyAppBar(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SEOText extends StatelessWidget {
  const SEOText(this.text, {super.key, this.textStyle});

  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}

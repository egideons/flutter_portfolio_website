import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.textRendererStyle,
  });

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}

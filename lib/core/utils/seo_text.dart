import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    super.key,
    this.textStyle,
    this.textAlign,
    this.textRendererStyle,
    this.maxLines,
    this.isSelectableText,
    this.textOverflow,
  });
  final bool? isSelectableText;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxLines;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return isSelectableText == true
        ? SelectableText(
            text,
            style: textStyle,
            textAlign: textAlign,
            maxLines: maxLines,
          )
        : Text(
            text,
            style: textStyle,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: textOverflow,
          );
  }
}

import 'package:flutter/material.dart';

import '../styles.dart';

class ResonantText extends StatelessWidget {
  const ResonantText.header(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = headerStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.subheader(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = subheaderStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.title(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = titleStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.subtitle(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = subtitleStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.base(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = baseStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.body(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = bodyStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText.caption(
    this.text, {
    this.textAlign = TextAlign.start,
    this.style = captionStyle,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  });

  const ResonantText({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.isSelectable = true,
    this.fontSize,
    this.letterSpacing,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool isSelectable;
  final double? fontSize;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    var styled = style ?? TextStyle();
    styled = styled.copyWith(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );

    if (isSelectable) {
      return SelectableText(
        text,
        style: styled,
        textAlign: textAlign,
      );
    }
    return Text(
      text,
      style: styled,
      textAlign: textAlign,
    );
  }
}

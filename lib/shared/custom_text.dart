import 'package:flutter/cupertino.dart';
import 'package:task_manar_app/core/utils/size_config.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: 2,
      style: TextStyle(
        fontSize: fontSize != null ? SizeConfig.defaultSize * fontSize! : null,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}

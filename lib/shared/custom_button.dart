import 'package:flutter/material.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width;
  final String text;
  final double? borderRadius;
  final Color? color;
  const CustomButton({
    super.key,
    this.onTap,
    this.width,
    required this.text,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.color2,
      borderRadius: BorderRadius.circular(borderRadius ?? 25),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 25),
        onTap: onTap,
        child: SizedBox(
          width: width ?? SizeConfig.defaultSize * 35,
          height: SizeConfig.defaultSize * 5.5,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize * 2.7,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

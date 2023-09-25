import 'package:flutter/material.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_text.dart';

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          CustomText(
            text,
            fontSize: 2,
            fontWeight: FontWeight.w500,
            color: AppColors.color2,
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.add,
              size: SizeConfig.defaultSize * 2.5,
              color: AppColors.color1,
            ),
          )
        ],
      ),
    );
  }
}

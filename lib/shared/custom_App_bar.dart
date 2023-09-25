import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_text.dart';
import 'package:task_manar_app/shared/space_widgets.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize * 1),
      height: SizeConfig.defaultSize * 10,
      child: Row(
        children: [
          const HorizintalSpace(1),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: SizeConfig.defaultSize * 4,
                height: SizeConfig.defaultSize * 4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: SizeConfig.defaultSize * 2.5,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
          CustomText(
            title,
            fontWeight: FontWeight.w400,
            color: AppColors.color2,
            fontSize: 2.5,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

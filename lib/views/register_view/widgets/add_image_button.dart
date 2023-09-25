import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/register_controller.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return GestureDetector(
      onTap: () {
        controller.selectImage();
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultSize * .7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.color1,
        ),
        child: Icon(
          Icons.add,
          size: SizeConfig.defaultSize * 3,
          color: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/register_controller.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_image.dart';
import 'package:task_manar_app/views/register_view/widgets/add_image_button.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(RegisterController());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          shape: const CircleBorder(),
          elevation: 10,
          child: GetBuilder<RegisterController>(
            builder: (controller) {
              return CustomImage(
                circleShape: true,
                fit: BoxFit.cover,
                width: SizeConfig.defaultSize * 23,
                height: SizeConfig.defaultSize * 23,
                iconSize: SizeConfig.defaultSize * 17,
                borderColor: Colors.grey.withOpacity(.2),
                imageFilePath: controller.imageFile?.path,
              );
            },
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize * 19,
          left: SizeConfig.defaultSize * 15,
          child: const AddImageButton(),
        ),
      ],
    );
  }
}

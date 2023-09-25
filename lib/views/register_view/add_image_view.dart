import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/register_controller.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_button.dart';
import 'package:task_manar_app/shared/custom_text.dart';
import 'package:task_manar_app/shared/space_widgets.dart';
import 'package:task_manar_app/views/register_view/widgets/custom_image_picker.dart';

class AddImageView extends StatelessWidget {
  const AddImageView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> arg = Get.arguments;

    return Scaffold(
      body: AddImageViewBody(arg: arg),
    );
  }
}

class AddImageViewBody extends StatelessWidget {
  const AddImageViewBody({super.key, required this.arg});
  final Map<String, String> arg;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize * 2.3,
        vertical: SizeConfig.defaultSize * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(5),
          Center(
            child: SvgPicture.asset(
              'assets/svg/log.svg',
              width: SizeConfig.defaultSize * 11.4,
              height: SizeConfig.defaultSize * 5,
            ),
          ),
          const VerticalSpace(10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                'Add Your Personal Photo',
                fontWeight: FontWeight.w700,
                fontSize: 2,
              ),
              VerticalSpace(1),
              CustomText(
                'Make Your Photo Clear',
                fontWeight: FontWeight.w500,
                fontSize: 1.5,
              ),
            ],
          ),
          const VerticalSpace(7),
          const Center(
            child: CustomImagePicker(),
          ),
          const Expanded(child: VerticalSpace(1)),
          CustomButton(
            text: 'Next',
            onTap: () {
              controller.register(
                fullName: arg['name'].toString(),
                phoneNumber: arg['phone'].toString(),
                password: arg['pas'].toString(),
                passwordConfirmation: arg['confpas'].toString(),
                image: controller.imageFile!.path,
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/register_controller.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/app_router.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_button.dart';
import 'package:task_manar_app/shared/custom_text.dart';
import 'package:task_manar_app/shared/custom_text_field.dart';
import 'package:task_manar_app/shared/space_widgets.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize * 2.3),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Material(
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
              ),
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const VerticalSpace(5),
                  Center(
                    child: SvgPicture.asset(
                      'assets/svg/log.svg',
                      width: SizeConfig.defaultSize * 12.4,
                      height: SizeConfig.defaultSize * 7,
                    ),
                  ),
                  const VerticalSpace(6),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      'Register',
                      fontSize: 4,
                      fontWeight: FontWeight.w700,
                      color: AppColors.color2,
                    ),
                  ),
                  const VerticalSpace(5),
                  CustomTextField(
                    hintText: 'Name',
                    keyboardType: TextInputType.text,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.color1,
                    ),
                    controller: controller.nameController,
                  ),
                  const VerticalSpace(4),
                  CustomTextField(
                    hintText: 'Phone Number',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.color1,
                    ),
                    controller: controller.phoneController,
                  ),
                  const VerticalSpace(4),
                  GetBuilder<RegisterController>(
                    init: RegisterController(),
                    builder: (controller) => CustomTextField(
                      hintText: 'Password',
                      obscureText: controller.obscureText,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'required';
                        } else if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.color1,
                      ),
                      controller: controller.passwordController,
                      suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          controller.showHidePassword();
                        },
                        child: Icon(
                          controller.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(4),
                  GetBuilder<RegisterController>(
                    builder: (controller) => CustomTextField(
                      hintText: 'Confirm Password',
                      obscureText: controller.obscureText1,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'required';
                        } else if (controller.confirmPasswordController.text !=
                            controller.passwordController.text) {
                          return "No match";
                        } else if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.color1,
                      ),
                      controller: controller.confirmPasswordController,
                      suffixIcon: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          controller.showHidePassword1();
                        },
                        child: Icon(
                          controller.obscureText1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(4),
                  CustomButton(
                    text: 'Register',
                    color: AppColors.color2,
                    onTap: () async {
                      if (controller.formKey.currentState!.validate()) {
                        Get.toNamed(AppRouter.addImageViewBody, arguments: {
                          'name': controller.nameController.text,
                          'phone': controller.phoneController.text,
                          'pas': controller.passwordController.text,
                          'confpas': controller.confirmPasswordController.text,
                        });
                      }
                    },
                  ),
                  const VerticalSpace(2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "You have an account?",
                        fontWeight: FontWeight.w700,
                        color: AppColors.color2,
                        fontSize: 1.6,
                      ),
                      const HorizintalSpace(1),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(15),
                        child: CustomText(
                          'Login',
                          color: AppColors.color1,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          fontSize: 1.6,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(6),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRouter.loginRout);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'If you continue, you agree to ',
                        style: TextStyle(
                          fontSize: SizeConfig.defaultSize * 1.6,
                          color: AppColors.color2,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'the terms and conditions and privacy policy',
                            style: TextStyle(
                              fontSize: SizeConfig.defaultSize * 1.6,
                              color: AppColors.color1,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

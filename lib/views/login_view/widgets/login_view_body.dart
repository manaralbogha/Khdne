import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/login_controller.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/app_router.dart';
import 'package:task_manar_app/core/utils/cache_helper.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_button.dart';
import 'package:task_manar_app/shared/custom_text.dart';
import 'package:task_manar_app/shared/custom_text_field.dart';
import 'package:task_manar_app/shared/space_widgets.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultSize * 2.3,
        vertical: SizeConfig.defaultSize * 2,
      ),
      child: Form(
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
            const VerticalSpace(13),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                'Login',
                fontSize: 4,
                fontWeight: FontWeight.w700,
                color: AppColors.color2,
              ),
            ),
            const VerticalSpace(5),
            CustomTextField(
              hintText: 'Phone Number',
              keyboardType: TextInputType.phone,
              prefixIcon: Icon(
                Icons.phone,
                color: AppColors.color1,
              ),
              controller: controller.phoneController,
            ),
            const VerticalSpace(4),
            GetBuilder<LoginController>(
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
            const VerticalSpace(1),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                child: CustomText(
                  'Forget Password?',
                  fontSize: 1.7,
                  fontWeight: FontWeight.w700,
                  color: AppColors.color2,
                ),
              ),
            ),
            const VerticalSpace(8),
            CustomButton(
              text: 'Login',
              onTap: () async {
                // log(CacheHelper.getData(key: 'Token'));
                if (controller.formKey.currentState!.validate()) {
                  await controller.login();
                }
              },
            ),
            const VerticalSpace(1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  "Don't have an account?",
                  fontWeight: FontWeight.w700,
                  color: AppColors.color2,
                  fontSize: 1.4,
                ),
                const HorizintalSpace(1),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRouter.registerRout);
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: CustomText(
                    'Create one',
                    color: AppColors.color1,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                    fontSize: 1.4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

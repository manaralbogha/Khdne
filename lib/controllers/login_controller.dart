import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/core/functions/custom_progress_indicator.dart';
import 'package:task_manar_app/core/utils/app_router.dart';
import 'package:task_manar_app/core/utils/cache_helper.dart';
import 'package:task_manar_app/models/auth_model.dart';
import 'package:task_manar_app/services/login_service.dart';

class LoginController extends GetxController {
  AuthModel? loginModel;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  Future<void> login() async {
    CustomProgressIndicator.showProgressIndicator(Get.context!);
    (await LoginService.login(
      number: phoneController.text,
      password: passwordController.text,
    ))
        .fold(
      (failure) {
        Get.back();
        Get.snackbar(
          'Error:',
          failure.failureMsg,
          backgroundColor: Colors.red,
        );
      },
      (loginModel) {
        this.loginModel = loginModel;
        phoneController.clear();
        passwordController.clear();
        CacheHelper.saveData(key: 'Token', value: loginModel.data!.token);
        Get.back();
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAndToNamed(AppRouter.myVehiclesView);
        // });
      },
    );
  }

  void showHidePassword() {
    obscureText = !obscureText;
    update();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manar_app/core/functions/custom_progress_indicator.dart';
import 'package:task_manar_app/core/utils/app_router.dart';
import 'package:task_manar_app/models/auth_model.dart';
import 'package:task_manar_app/services/register_services.dart';

class RegisterController extends GetxController {
  AuthModel? registerModel;
  XFile? imageFile;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;
  bool obscureText1 = true;

  Future<void> register({
    required String fullName,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required String image,
  }) async {
    CustomProgressIndicator.showProgressIndicator(Get.context!);
    (await RegisterServices.register(
      fullName: fullName,
      phoneNumber: phoneNumber,
      password: password,
      passwordConfirmation: passwordConfirmation,
      image: image,
    ))
        .fold(
      (failure) {
        Get.back();
        Get.back();
        Get.snackbar(
          'Error',
          failure.failureMsg,
          backgroundColor: Colors.red,
        );
      },
      (registerModel) {
        this.registerModel = registerModel;
        nameController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Get.back();
        Get.offAllNamed(AppRouter.loginRout);
        Get.snackbar(
          '',
          'Account Created Successfully',
          backgroundColor: Colors.green,
        );
      },
    );
  }

  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    update();
  }

  void showHidePassword() {
    obscureText = !obscureText;
    update();
  }

  void showHidePassword1() {
    obscureText1 = !obscureText1;
    update();
  }
}

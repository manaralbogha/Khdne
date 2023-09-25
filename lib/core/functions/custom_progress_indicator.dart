import 'package:flutter/material.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';

abstract class CustomProgressIndicator {
  static bool isOpen = false;

  static void showProgressIndicator(BuildContext context) {
    isOpen = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.color1.withOpacity(.3),
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      ),
    ).then((value) => isOpen = false);
  }
}

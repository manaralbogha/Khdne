import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/core/utils/cache_helper.dart';
import 'package:task_manar_app/models/my_vehicle_model.dart';
import 'package:task_manar_app/services/my_vehicle_services.dart';

class MyVehicleController extends GetxController {
  MyVehicleModel? myVehicleModel;

  Future<void> getVehicle() async {
    update();
    (await MyVehicleServices.getVehicle(
            token: await CacheHelper.getData(key: "Token")))
        .fold(
      (failure) {
        Get.snackbar(
          'Error:',
          failure.failureMsg,
          backgroundColor: Colors.red,
        );
      },
      (myVehicleModel) {
        this.myVehicleModel = myVehicleModel;
      },
    );
    update();
  }

  @override
  void onInit() {
    print('object');
    getVehicle();

    super.onInit();
  }
}

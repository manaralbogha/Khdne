import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manar_app/core/functions/custom_progress_indicator.dart';
import 'package:task_manar_app/core/utils/app_router.dart';
import 'package:task_manar_app/core/utils/cache_helper.dart';

import 'package:task_manar_app/models/add_vehicle_model.dart';
import 'package:task_manar_app/services/add_vehcle_services.dart';

class AddVehicleController extends GetxController {
  AddVehicleModel? vehicleModel;
  Map<String, XFile?> imageFile = {
    '1-Mechanics picture': null,
    '2-Image of the vehicle': null,
    '3-Picture of the painting': null,
    '4-Personal identity': null,
    '5-Agency or delegation': null,
  };

  final formKey = GlobalKey<FormState>();
  String? idType;
  final typeController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final plateNumberController = TextEditingController();

  Future<void> addVehicle(
      //   {
      //   // required String vehicleTypeId,
      //   // required String boardNumber,
      //   // required String model,
      //   // required String color,
      //   // required String vehicleImage,
      //   // required String boardImage,
      //   // required String idImage,
      //   // required String mechanicImage,
      //   // required String delegateImage,
      //   // required String token,
      // }
      ) async {
    CustomProgressIndicator.showProgressIndicator(Get.context!);
    (await AddVehicleServices.addVehicle(
      vehicleTypeId: idType.toString(),
      boardNumber: plateNumberController.text,
      model: modelController.text,
      color: colorController.text,
      vehicleImage: imageFile['1-Mechanics picture']!.path,
      boardImage: imageFile['2-Image of the vehicle']!.path,
      idImage: imageFile['3-Picture of the painting']!.path,
      mechanicImage: imageFile['4-Personal identity']!.path,
      delegateImage: imageFile['5-Agency or delegation']!.path,
      token: await CacheHelper.getData(key: 'Token'),
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
      (vehicleModel) {
        this.vehicleModel = vehicleModel;
        Get.back();
        Get.snackbar(
          '',
          'Added Successfully',
          backgroundColor: Colors.green,
        );
        Get.offAllNamed(AppRouter.myVehiclesView);
      },
    );
  }

  List<Map<String, String>> type = [
    {'id': '1', 'type': 'A'},
    {'id': '2', 'type': 'B'},
    {'id': '3', 'type': 'C'},
    {'id': '4', 'type': 'D'},
  ];

  List<String> colors = ['red', 'blue', 'black'];
  List<String> nameImage = [
    '1-Mechanics picture',
    '2-Image of the vehicle',
    '3-Picture of the painting',
    '4-Personal identity',
    '5-Agency or delegation',
  ];

  Future<void> selectImage({required int index}) async {
    final ImagePicker picker = ImagePicker();
    imageFile[nameImage[index]] = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    update();
  }

  bool validatorHelper() {
    for (int i = 0; i < imageFile.length; i++) {
      if (imageFile.values.elementAt(i) == null) {
        return false;
      }
    }
    return true;
  }
}

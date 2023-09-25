import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:task_manar_app/core/constants/end_points.dart';
import 'package:task_manar_app/core/errors/failures.dart';
import 'package:task_manar_app/core/utils/http_api_services.dart';
import 'package:task_manar_app/models/add_vehicle_model.dart';

abstract class AddVehicleServices {
  static Future<Either<Failure, AddVehicleModel>> addVehicle({
    required String vehicleTypeId,
    required String boardNumber,
    required String model,
    required String color,
    required String vehicleImage,
    required String boardImage,
    required String idImage,
    required String mechanicImage,
    required String delegateImage,
    required String token,
  }) async {
    try {
      var response = await ApiServices.postWithImages(
        endPoint: AppEndPoints.addVehicle,
        imagesPath: {
          'vehicle_image': vehicleImage,
          'board_image': boardImage,
          'id_image': idImage,
          'mechanic_image': mechanicImage,
          'delegate_image': delegateImage,
        },
        body: {
          'vehicle_type_id': vehicleTypeId,
          'board_number': boardNumber,
          'model': model,
          'color': color,
        },
        token: token,
      );
      return right(AddVehicleModel.fromJson(response));
    } catch (ex) {
      var helper = json.decode(ex.toString().split('Exception:')[1]);
      return left(Failure(failureMsg: helper['message']));
    }
  }
}

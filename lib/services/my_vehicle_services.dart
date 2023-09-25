import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:task_manar_app/core/constants/end_points.dart';
import 'package:task_manar_app/core/errors/failures.dart';
import 'package:task_manar_app/core/utils/http_api_services.dart';
import 'package:task_manar_app/models/my_vehicle_model.dart';

abstract class MyVehicleServices {
  static Future<Either<Failure, MyVehicleModel>> getVehicle(
      {required String token}) async {
    try {
      var response = await ApiServices.get(
          endPoint: AppEndPoints.getVehicle, token: token);
      return right(MyVehicleModel.fromJson(response));
    } catch (ex) {
      var helper = json.decode(ex.toString().split('Exception:')[1]);
      return left(Failure(failureMsg: helper['message']));
    }
  }
}

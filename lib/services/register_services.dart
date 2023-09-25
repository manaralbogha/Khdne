import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:task_manar_app/core/constants/end_points.dart';
import 'package:task_manar_app/core/errors/failures.dart';
import 'package:task_manar_app/core/utils/http_api_services.dart';
import 'package:task_manar_app/models/auth_model.dart';

abstract class RegisterServices {
  static Future<Either<Failure, AuthModel>> register({
    required String fullName,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required String image,
  }) async {
    try {
      var response = await ApiServices.postWithImage(
        endPoint: AppEndPoints.register,
        imagePath: image,
        body: {
          'fullname': fullName,
          'phone_number': phoneNumber,
          'password': password,
          'password_confirmation': passwordConfirmation,
        },
      );
      return right(AuthModel.fromJson(response));
    } catch (ex) {
      // log(ex.toString());
      // return left(Failure(failureMsg: ex.toString()));
      var helper = json.decode(ex.toString().split('Exception:')[1]);
      return left(
        Failure(
          failureMsg: helper['message'],
        ),
      );
    }
  }
}

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_manar_app/core/utils/app_router.dart';
// import 'package:task_manar_app/core/utils/cache_helper.dart';

// class TestMiddleware extends GetMiddleware {
//   // @override
//   // int? get priority => 1;

//   @override
//   RouteSettings? redirect(String? route) {
//     log('xxxxxxx');
//     if (CacheHelper.getData(key: 'Token') != null) {
//       return const RouteSettings(name: AppRouter.myVehiclesView);
//     }
//     return null;
//   }
// }

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:task_manar_app/views/add_vehicles_view/add_vehicles_view.dart';
import 'package:task_manar_app/views/login_view/login_view.dart';
import 'package:task_manar_app/views/my_vehicles_view/my_vehicles_view.dart';
import 'package:task_manar_app/views/register_view/add_image_view.dart';
import 'package:task_manar_app/views/register_view/register_view.dart';

abstract class AppRouter {
  static const String loginRout = '/';
  static const String registerRout = '/register';
  static const String addImageViewBody = '/AddImageViewBody';
  static const String myVehiclesView = '/MyVehiclesView';
  static const String addVehiclesView = '/AddVehiclesView';
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: loginRout,
      page: () => const LoginView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: registerRout,
      page: () => const RegisterView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: addImageViewBody,
      page: () => const AddImageView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: myVehiclesView,
      page: () => const MyVehiclesView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: addVehiclesView,
      page: () => const AddVehiclesView(),
      transition: Transition.leftToRight,
    )
  ];
}

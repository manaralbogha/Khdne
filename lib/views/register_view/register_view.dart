import 'package:flutter/material.dart';
import 'package:task_manar_app/views/register_view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    // final RegisterController controller = Get.put(RegisterController());
    return const SafeArea(
      child: Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}

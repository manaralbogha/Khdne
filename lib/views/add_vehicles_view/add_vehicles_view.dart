import 'package:flutter/material.dart';
import 'package:task_manar_app/views/add_vehicles_view/widgets/add_vehicles_view_body.dart';

class AddVehiclesView extends StatelessWidget {
  const AddVehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AddVehiclesViewBody(),
      ),
    );
  }
}

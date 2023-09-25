import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_manar_app/controllers/add_vehicle_controller.dart';
import 'package:task_manar_app/core/styles/app_colors.dart';
import 'package:task_manar_app/core/utils/size_config.dart';
import 'package:task_manar_app/shared/custom_App_bar.dart';
import 'package:task_manar_app/shared/custom_button.dart';
import 'package:task_manar_app/shared/custom_image.dart';
import 'package:task_manar_app/shared/custom_text.dart';
import 'package:task_manar_app/shared/custom_text_field.dart';
import 'package:task_manar_app/shared/space_widgets.dart';
import 'package:task_manar_app/views/add_vehicles_view/widgets/add_image.dart';

class AddVehiclesViewBody extends StatelessWidget {
  const AddVehiclesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AddVehicleController controller = Get.put(AddVehicleController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2.3,
          vertical: SizeConfig.defaultSize * 0.1,
        ),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const CustomAppBar(title: 'Add Vehicles'),
              const VerticalSpace(2),
              CustomTextField(
                disableFocusNode: true,
                controller: controller.typeController,
                hintText: 'The type of the vehicle',
                prefixIcon: SvgPicture.asset(
                  'assets/svg/type.svg',
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: SvgPicture.asset(
                  'assets/svg/arrow.svg',
                  fit: BoxFit.scaleDown,
                ),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Select Type',
                      content: Column(
                        children: List.generate(
                            controller.type.length,
                            (index) => InkWell(
                                  onTap: () {
                                    controller.typeController.text = controller
                                        .type[index]['type']
                                        .toString();
                                    controller.idType =
                                        controller.type[index]['id'];
                                    Get.back();
                                    print(controller.idType);
                                  },
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      Text('${controller.type[index]['type']}'),
                                      const Divider()
                                    ],
                                  ),
                                )),
                      ));
                },
              ),
              const VerticalSpace(1),
              CustomTextField(
                hintText: 'Model',
                controller: controller.modelController,
                keyboardType: TextInputType.text,
                prefixIcon: SvgPicture.asset(
                  'assets/svg/model.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(1),
              CustomTextField(
                disableFocusNode: true,
                hintText: 'Vehicle color',
                controller: controller.colorController,
                prefixIcon: SvgPicture.asset(
                  'assets/svg/color.svg',
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: SvgPicture.asset(
                  'assets/svg/arrow.svg',
                  fit: BoxFit.scaleDown,
                ),
                onTap: () {
                  Get.defaultDialog(
                      title: 'Select Color',
                      content: Column(
                        children: List.generate(
                            controller.colors.length,
                            (index) => InkWell(
                                  onTap: () {
                                    controller.colorController.text =
                                        controller.colors[index].toString();
                                    Get.back();
                                    print(controller.colorController.text);
                                  },
                                  child: Column(
                                    children: [
                                      const Divider(),
                                      Text(controller.colors[index]),
                                      const Divider()
                                    ],
                                  ),
                                )),
                      ));
                },
              ),
              const VerticalSpace(1),
              CustomTextField(
                hintText: 'Plate Number',
                keyboardType: TextInputType.number,
                controller: controller.plateNumberController,
                prefixIcon: SvgPicture.asset(
                  'assets/svg/number.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              const VerticalSpace(2),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  'Vehicle photos',
                  fontSize: 3,
                  fontWeight: FontWeight.w500,
                  color: AppColors.color2,
                ),
              ),
              const VerticalSpace(2),
              ...List.generate(
                controller.imageFile.length,
                (index) => Column(
                  children: [
                    AddImage(
                        text: controller.imageFile.keys.elementAt(index),
                        onTap: () {
                          controller.selectImage(index: index);
                        }),
                    const VerticalSpace(1),
                  ],
                ),
              ),
              const VerticalSpace(2.5),
              GetBuilder<AddVehicleController>(
                init: AddVehicleController(),
                builder: (controller) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                        height: SizeConfig.defaultSize * 14,
                        child: Row(
                          children: List.generate(controller.imageFile.length,
                              (index) {
                            if (controller
                                    .imageFile[controller.nameImage[index]] !=
                                null) {
                              return CustomImage(
                                imageFilePath: controller
                                    .imageFile[controller.nameImage[index]]!
                                    .path,
                              );
                            }
                            return SizedBox();
                          }),
                        )),
                  );
                },
              ),
              const VerticalSpace(2.5),
              CustomButton(
                text: 'Add Vehicle',
                onTap: () {
                  controller.imageFile.forEach((key, value) {
                    print(controller.imageFile.toString());
                  });
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.validatorHelper()) {
                      controller.addVehicle();
                    } else {
                      Get.snackbar(
                        '',
                        'Please select all images',
                        backgroundColor: Colors.red,
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

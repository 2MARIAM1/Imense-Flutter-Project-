import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/core/shared_components/customs/custom_dropdown/custom_dropdown.dart';
import 'package:imense_project/presentation/controllers/addalert_controller.dart';
import 'package:imense_project/presentation/widgets/swiper_widget.dart';
import 'package:imense_project/presentation/widgets/toggle_widget.dart';

class AddAlertPage extends StatelessWidget {
  AddAlertPage({super.key});
  final controller = Get.find<AddAlertController>();

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: null,
        backgroundColor: AppColors.lightgrey2,
        title: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Manual alert",
            style: AppTextStyle.mediumTitleStyle.copyWith(
                fontWeight: FontWeight.w600, color: AppColors.basicblackcolor),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.turn_left), // Replace with your custom icon
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Obx(
          () => Column(
            children: [
              CustomDropdownMenu(
                  label: "Site",
                  myvalue: controller.selectedSite.value,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedSite.value = value;
                    }
                  },
                  list: controller.siteList,
                  favoriteIcon: true),
              CustomDropdownMenu(
                  label: "Zone",
                  myvalue: controller.selectedZone.value,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedZone.value = value;
                    }
                  },
                  list: controller.zoneList,
                  favoriteIcon: true),
              SwiperWidget(addAlertController: controller),
              ToggleWidget(
                elements: controller.locationElements,
                toggle: controller.toggleLocation,
              ),
              if (controller.toggleLocation.value == 0)
                CustomDropdownMenu(
                    label: "Room",
                    myvalue: controller.selectedRoom.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedRoom.value = value;
                      }
                    },
                    list: controller.roomList,
                    labelTextButton: '+ add',
                    onLabelTextButtonPressed: () {
                      controller.onAddRoom();
                    }),
              if (controller.toggleLocation.value == 1)
                CustomDropdownMenu(
                    label: "Equipment",
                    myvalue: controller.selectedEquipment.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedEquipment.value = value;
                      }
                    },
                    list: controller.equipmentList,
                    labelTextButton: '+ add',
                    onLabelTextButtonPressed: () {
                      controller.onAddEquipment();
                    }),
              ToggleWidget(
                elements: controller.positionElements,
                toggle: controller.togglePosition,
              ),
              CustomDropdownMenu(
                label: "Time expected to complete the job",
                myvalue: controller.selectedTime.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedTime.value = value;
                  }
                },
                list: controller.timeList,
              ),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.transparent,
        color: AppColors.white,
        height: 75,
        child: TextButton(
            onPressed: () {
              controller.onSubmit();
            },
            style: TextButton.styleFrom(
                backgroundColor: AppColors.bluecolor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Transform.rotate(
                //   angle: -0.75,
                //   child:
                Icon(
                  Icons.near_me_rounded,
                  size: 24,
                  color: AppColors.white,
                ),
                // ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Send alert',
                  style: AppTextStyle.medium15TitleStyle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

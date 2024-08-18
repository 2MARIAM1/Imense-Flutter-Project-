import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/shared_components/customs/custom_dialog.dart';
import 'package:imense_project/core/shared_components/customs/custom_textfield.dart';
import 'package:imense_project/presentation/screens/homepage.dart';

class AddAlertController extends GetxController {
  var selectedSite = 'Site 001'.obs;
  var selectedZone = 'Zone 001'.obs;
  var selectedRoom = 'Room 1.01'.obs;
  var selectedTime = ''.obs;
  var addedRoom = ''.obs;
  var addedEquipment = ''.obs;
  var selectedEquipment = 'Equipment 1.01'.obs;
  var selectedLevel = 0.obs;
  var toggleLocation = 0.obs;
  var togglePosition = 0.obs;
  var locationElements = ["Room", "Equipment"].obs;
  var positionElements = ["Inside", "Outside"].obs;
  var levelsList = [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].obs;
  var siteList = ['Site 001', 'Site 002', 'Site 003'].obs;
  var zoneList = ['Zone 001', 'Zone 002', 'Zone 003'].obs;
  var roomList = ['Room 1.01', 'Room 1.02', 'Room 1.03'].obs;
  var equipmentList =
      ['Equipment 1.01', 'Equipment 1.02', 'Equipment 1.03'].obs;
  var timeList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    generateTimeOptions();
    selectedTime.value = timeList[0];
  }

// GENERATE THE LIST OF TIME OPTIONS
  void generateTimeOptions() {
    for (int i = 60; i >= 5; i -= 5) {
      timeList.add('$i Minutes');
    }
  }

  void onAddRoom() {
    showCustomDialog(
        activeBtnText: "Add",
        customContent: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customTextField(
                label: 'New room',
                onChanged: (value) {
                  addedRoom.value = value;
                }),
          ],
        ),
        onConfirm: () {
          if (addedRoom.value.isNotEmpty) {
            roomList.add(addedRoom.value);
            selectedRoom.value = addedRoom.value;
            Get.back();
          }
        });
  }

  void onAddEquipment() {
    showCustomDialog(
        activeBtnText: "Add",
        customContent: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customTextField(
                label: 'New equipment',
                onChanged: (value) {
                  addedEquipment.value = value;
                }),
          ],
        ),
        onConfirm: () {
          if (addedEquipment.value.isNotEmpty) {
            equipmentList.add(addedEquipment.value);
            selectedEquipment.value = addedEquipment.value;
            Get.back();
          }
        });
  }

  void onSubmit() {
    Get.to(() => HomePage());
    Get.snackbar("Sucess", "Alert sent successfully.",
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10));
  }
}

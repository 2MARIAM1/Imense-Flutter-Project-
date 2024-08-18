import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

class PieChartController extends GetxController {
  var touchedIndex = (-1).obs;

  List<PieChartSectionData> piechatdata = [
    PieChartSectionData(
      color: AppColors.bluecolor1, // Red
      value: 4,
      title: "Pending",
      radius: 30,
      showTitle: false,
      badgeWidget: Text(
        "4",
        style: AppTextStyle.smallText,
      ),
    ),
    PieChartSectionData(
      color: AppColors.yellowcolor, // Green
      value: 1,
      title: 'Progress',
      radius: 30,
      showTitle: false,
      badgeWidget: Text(
        "1",
        style: AppTextStyle.smallText,
      ),

      // borderSide: BorderSide(color: Colors.white)
    ),
    PieChartSectionData(
      color: AppColors.greencolor, // Orange
      value: 2,
      title: 'Resolved',
      radius: 30,
      showTitle: false,
      badgeWidget: Text(
        "2",
        style: AppTextStyle.smallText,
      ),
    ),
    PieChartSectionData(
      color: AppColors.darkgreycolor, // Purple
      value: 1,
      title: 'Closed',
      radius: 30,
      showTitle: false,
      // borderSide: BorderSide(color: Colors.white)
      badgeWidget: Text(
        "1",
        style: AppTextStyle.smallText,
      ),
    ),
  ];
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var fakeTitles = [
    "Daily",
    "Safety",
    "Excellent",
    "Work clothes, E.P.I",
    "Bad condition"
  ].obs;

  List<double> barChartData = [4, 9, 5, 10, 2, 4, 16, 3, 1, 6];
  List<PieChartSectionData> piechatdata = [
    PieChartSectionData(
      color: Color(0xFF3498db), // Blue
      value: 30,
      // title: '30%',
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Color(0xFFe74c3c), // Red
      value: 20,
      // title: '20%',
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Color(0xFF2ecc71), // Green
      value: 25,
      // title: '25%',
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Color(0xFFF39c12), // Orange
      value: 15,
      // title: '15%',
      radius: 50,
      titleStyle: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    PieChartSectionData(
      color: Color(0xFF9b59b6), // Purple
      value: 10,
      // title: '10%',
      radius: 50,
      showTitle: false,
      //   titleStyle: TextStyle(
      //       fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  ];

  void removeFilter(String title) {
    fakeTitles.remove(title);
  }

  void clearFilter() {
    fakeTitles.clear();
  }
}

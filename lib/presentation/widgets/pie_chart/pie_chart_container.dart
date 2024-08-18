import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/presentation/widgets/pie_chart/pie_chart_controller.dart';

class PieChartContainer extends StatelessWidget {
  PieChartContainer({super.key});
  final controller = Get.put(PieChartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 45,
                      // pieTouchData: PieTouchData(enabled: true,),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          if (event is FlTapUpEvent) {
                            controller.touchedIndex.value = pieTouchResponse!
                                .touchedSection!.touchedSectionIndex;
                            print(controller.touchedIndex);
                          } else {}
                        },
                      ),
                      sections: controller.piechatdata,
                      titleSunbeamLayout: true),
                ),
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: Obx(() => (controller.touchedIndex.value >= 0)
                //           ? Text(
                //               controller
                //                   .piechatdata[controller.touchedIndex.value]
                //                   .value
                //                   .toInt()
                //                   .toString(),
                //               style: TextStyle(
                //                   fontSize: 10,
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black),
                //             )
                //           : Text("data")
                //       // Container(),
                //       ),
                // )
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.piechatdata.map((section) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: section.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        section.title,
                        style: AppTextStyle.small11GreyText,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

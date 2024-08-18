import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

class BarChartContainer extends StatelessWidget {
  final List<double> data;

  const BarChartContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Ensure data is valid and not empty
    if (data.isEmpty || data.any((value) => value.isNaN || value.isInfinite)) {
      return const Center(child: Text("No valid data available"));
    }
    // Find the maximum value in the data for the Y axis
    double maxY = data.reduce((a, b) => a > b ? a : b) + 5;

    // Ensure maxY is not NaN or Infinity
    if (maxY.isNaN || maxY.isInfinite) {
      maxY = 20; // Set a default maxY value if needed
    }
    List<int> getLastTenDays() {
      DateTime now = DateTime.now();
      List<int> days = [];

      for (int i = 0; i < 10; i++) {
        DateTime day = now.subtract(Duration(days: i));
        days.add(day.day);
      }

      return days.reversed.toList();
    }

    List<int> lastTenDays = getLastTenDays();

    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY,
          minY: 0,
          barTouchData: BarTouchData(enabled: true),
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  int dayIndex = value.toInt();
                  String dayTitle = lastTenDays[dayIndex].toString();

                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      dayTitle,
                      style: AppTextStyle.medium13TitleStyle
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  );
                },
                reservedSize: 28,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: data.asMap().entries.map((entry) {
            int index = entry.key;
            double value = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                    fromY: 0,
                    toY: value,
                    color: AppColors.bluecolor2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3)))
              ],
              // showingTooltipIndicators: [0],
            );
          }).toList(),
        ),
      ),
    );
  }
}

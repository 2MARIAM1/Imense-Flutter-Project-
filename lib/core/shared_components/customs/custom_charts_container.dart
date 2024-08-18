import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/presentation/widgets/filter_bottom_sheet.dart';

class CustomChartsContainer extends StatelessWidget {
  final Widget customcontent;
  final String title;
  final String subtitle;
  final void Function()? onClear;

  const CustomChartsContainer(
      {super.key,
      required this.customcontent,
      required this.title,
      required this.subtitle,
      this.onClear});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightgrey2,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyle.medium15TitleStyle),
                      Text(subtitle, style: AppTextStyle.smallItallicGreyText)
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      openBottomSheet(height * 0.45, onClear);
                    },
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.greycolor,
                    ))
              ],
            ),
            customcontent,
          ],
        ));
  }
}

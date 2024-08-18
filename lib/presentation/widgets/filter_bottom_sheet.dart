import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/core/constants/assets_paths.dart';

void openBottomSheet(double height, void Function()? onClear) {
  Get.bottomSheet(
    Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                  )),
              Text(
                'Filter by',
                style: AppTextStyle.medium15TitleStyle,
              ),
              TextButton(
                  onPressed: onClear,
                  child: Text(
                    'Clear',
                    style: AppTextStyle.medium15TitleStyle
                        .copyWith(color: AppColors.bluecolor1),
                  ))
            ],
          ),
          filterCategory('Date', AssetsPaths.calendarIcon),
          filterCategory('Type', AssetsPaths.typeIcon),
          filterCategory('Status', AssetsPaths.statusIcon),
          filterCategory('Category', AssetsPaths.categoryIcon),
          filterCategory('Subcategory', AssetsPaths.subcategoryIcon),
          filterCategory('Tags', AssetsPaths.tagIcon),
        ],
      ),
    ),
    isDismissible: true,
    backgroundColor:
        Colors.transparent, // Optional: Make background transparent
  );
}

Widget filterCategory(String title, String iconPath) {
  return Container(
      child: Row(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 25,
        height: 25,
        child: SvgPicture.asset(iconPath),
      ),
      Text(title,
          style: AppTextStyle.medium13TitleStyle
              .copyWith(color: AppColors.greycolor)),
      Spacer(),
      IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.greycolor,
          size: 16,
        ),
        onPressed: () {},
      )
    ],
  ));
}

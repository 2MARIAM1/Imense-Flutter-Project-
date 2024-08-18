import 'package:flutter/material.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

Widget customTextField({String? label, void Function(String)? onChanged}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label ?? "",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppTextStyle.medium13TitleStyle),
      SizedBox(
        height: 6,
      ),
      TextFormField(
        style: AppTextStyle.medium13TitleStyle
            .copyWith(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.darkpurplecolor1.withOpacity(0.7), width: 1.5),
            borderRadius: BorderRadius.circular(2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.darkpurplecolor1.withOpacity(0.7), width: 2.0),
            borderRadius: BorderRadius.circular(2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greycolor2, width: 1),
            borderRadius:
                BorderRadius.circular(2.0), // Focused error border radius
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius:
                BorderRadius.circular(2.0), // Focused error border radius
          ),
        ),
        onChanged: onChanged,
      ),
    ],
  );
}

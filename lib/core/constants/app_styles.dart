import 'package:flutter/material.dart';
import 'package:imense_project/core/constants/app_colors.dart';

class AppTextStyle {
  static const String nunitoFont = "Nunito";
  static const String robotoFont = "Roboto";
  static const TextStyle titleStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w800,
      color: AppColors.white, // Colors.black,
      fontFamily: robotoFont);
  static const TextStyle mediumTitleStyle = TextStyle(
      fontSize: 18,
      color: AppColors.white, // Colors.black,
      fontFamily: nunitoFont);
  static const TextStyle medium15TitleStyle = TextStyle(
      fontSize: 15,
      color: AppColors.basicblackcolor, // Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: nunitoFont);
  static const TextStyle medium13TitleStyle = TextStyle(
      fontSize: 13,
      color: AppColors.basicblackcolor, // Colors.black,
      fontWeight: FontWeight.w600,
      fontFamily: nunitoFont);

  static const TextStyle smallGreyText = TextStyle(
      fontSize: 12,
      color: AppColors.darkgreycolor2, // Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: nunitoFont);
  static const TextStyle smallItallicGreyText = TextStyle(
      fontSize: 12,
      fontStyle: FontStyle.italic,
      color: AppColors.greycolor, // Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: nunitoFont);
  static const TextStyle small11GreyText = TextStyle(
      fontSize: 11,
      color: AppColors.darkgreycolor2, // Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: nunitoFont);
  static const TextStyle smallText = TextStyle(
      fontSize: 12,
      color: AppColors.white, // Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: nunitoFont);
}

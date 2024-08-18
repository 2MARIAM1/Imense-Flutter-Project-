import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

void showCustomDialog({
  String? title,
  String? activeBtnText,
  String? negativeBtnText,
  Widget? customContent,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  bool? barrierDissmissable,
}) {
  Get.dialog(
      Dialog(
        // surfaceTintColor: AppColors.whiteColor.withOpacity(0.7),
        backgroundColor: AppColors.white.withOpacity(0.8),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTextStyle.nunitoFont)),
                  ),
                  const Divider(),
                ],
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: customContent ?? Container()),
                const SizedBox(height: 20),
                if (negativeBtnText != null || activeBtnText != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (negativeBtnText != null)
                        customButton(
                          negativeBtnText,
                          onCancel ?? Get.back,
                        ),
                      if (activeBtnText != null)
                        customButton(
                          activeBtnText,
                          onConfirm ?? Get.back,
                        ),
                    ],
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDissmissable ?? true);
}

Widget customButton(String text, void Function()? onTap) {
  return TextButton(
    onPressed: onTap,
    style: TextButton.styleFrom(
      backgroundColor: AppColors.darkpurplecolor1,
      // side: BorderSide(color: AppColors.darkpurplecolor1, width: 2.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      fixedSize: Size(
        110,
        40,
      ),
      padding: const EdgeInsets.all(8),
    ),
    child: Text(
      text,
      style: AppTextStyle.medium13TitleStyle.copyWith(color: AppColors.white),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

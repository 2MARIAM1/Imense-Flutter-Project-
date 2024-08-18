import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

class StatsContainer extends StatelessWidget {
  final String title;
  final String value;

  final Color? backgroundIconColor;
  final Color? iconColor;
  final IconData? icon;
  final String? svgPath;
  final double? fontSize;

  const StatsContainer(
      {super.key,
      required this.title,
      required this.value,
      this.backgroundIconColor,
      this.iconColor,
      this.icon,
      this.svgPath,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: 170,
      height: 60,
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
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: backgroundIconColor,
              shape: BoxShape.circle, // Makes the container circular
            ),
            child: Center(
              child: (icon == null && svgPath != null)
                  ? SvgPicture.asset(
                      svgPath!,
                      // color: iconColor,
                    )
                  : Text(
                      String.fromCharCode(icon!.codePoint),
                      style: TextStyle(
                        inherit: false,
                        fontSize: fontSize,
                        color: iconColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: icon!.fontFamily,
                      ),
                    ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: AppTextStyle.medium13TitleStyle,
                  overflow: TextOverflow.ellipsis),
              Text(
                title,
                style: AppTextStyle.smallGreyText,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}

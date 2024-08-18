import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';

class FilterContainer extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const FilterContainer(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(130, 158, 158, 158),
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Text(
              title,
              style: AppTextStyle.small11GreyText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 30,
            child: TextButton(
              child: Icon(
                Icons.close_rounded,
                size: 16,
                color: AppColors.darkgreycolor2,
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/core/shared_components/customs/custom_dropdown/custom_dropdown_controller.dart';

class CustomDropdownMenu extends StatelessWidget {
  final String label;
  final String myvalue;
  final Function(String?) onChanged;
  final RxList<String> list;
  final bool favoriteIcon;
  final String? labelTextButton;
  final Function()? onLabelTextButtonPressed;

  CustomDropdownMenu({
    super.key,
    required this.label,
    required this.myvalue,
    required this.onChanged,
    required this.list,
    this.favoriteIcon = false,
    this.labelTextButton,
    this.onLabelTextButtonPressed,
  });

  final controller = Get.put(CustomDropDownController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (labelTextButton != null)
          Positioned(
            top: 0,
            right: 0,
            child: TextButton(
                onPressed: onLabelTextButtonPressed,
                child: Text(
                  labelTextButton ?? '',
                  style: AppTextStyle.medium13TitleStyle.copyWith(
                      color: AppColors.blueactioncolor,
                      fontWeight: FontWeight.w500),
                )),
          ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label.isNotEmpty) ...[
                Text(
                  label,
                  style: AppTextStyle.medium13TitleStyle.copyWith(
                    color: AppColors.basicblackcolor,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
              DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: AppColors.darkpurplecolor1,

                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.darkpurplecolor1.withOpacity(0.7),
                        width: 1.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: AppColors.darkpurplecolor1.withOpacity(0.7),
                        width: 2.0),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.greycolor2, width: 1),
                    borderRadius: BorderRadius.circular(
                        2.0), // Focused error border radius
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(
                        2.0), // Focused error border radius
                  ),
                ),
                value: myvalue,
                // style: TextStyle(
                //     overflow: TextOverflow.ellipsis,
                //     fontSize: 11,
                //     letterSpacing: 0.7,
                //     fontFamily: 'Poppins',
                //     color: isEnabled ? AppColors.basicblackcolor : Colors.grey),
                onChanged: (value) => onChanged(value),
                selectedItemBuilder: (context) =>
                    list.map<Widget>((String item) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.medium13TitleStyle.copyWith(
                            color: AppColors.basicblackcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      if (favoriteIcon == true)
                        Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.toggleFavorite(item);
                                },
                                child: Icon(Icons.bookmark,
                                    color: controller.isFavorite(item)
                                        ? AppColors.yellowcolor
                                        : AppColors.greycolor2),
                              ),
                            )),
                    ],
                  );
                }).toList(),
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 16),
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.medium13TitleStyle
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                        Container(
                          height: 1.5,
                          // width: 190,
                          color: AppColors.white,
                          margin: const EdgeInsets.only(top: 16),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

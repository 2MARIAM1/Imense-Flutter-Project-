import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/presentation/controllers/addalert_controller.dart';

class ToggleWidget extends StatelessWidget {
  final Rx<int> toggle;
  final RxList<String> elements;
  ToggleWidget({super.key, required this.toggle, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Location', style: AppTextStyle.medium13TitleStyle),
          const SizedBox(
            height: 6,
          ),
          Center(
            child: Obx(() {
              return ToggleButtons(
                isSelected: [0 == toggle.value, 1 == toggle.value],
                children: elements.map((element) {
                  return Container(
                      padding: EdgeInsets.all(8.0),
                      width: (MediaQuery.of(context).size.width - 45) /
                          elements.length,
                      child: Text(element,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.medium13TitleStyle.copyWith(
                            fontWeight: FontWeight.w500,
                          )));
                }).toList(),
                onPressed: (int index) {
                  toggle.value = index;
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

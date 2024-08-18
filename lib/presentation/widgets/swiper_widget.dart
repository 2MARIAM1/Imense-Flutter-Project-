import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/presentation/controllers/addalert_controller.dart';

class SwiperWidget extends StatelessWidget {
  final AddAlertController addAlertController;
  const SwiperWidget({super.key, required this.addAlertController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Level",
              style: AppTextStyle.medium13TitleStyle.copyWith(
                color: AppColors.basicblackcolor,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 50, // Adjust height to fit the containers
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(6, (i) {
                        int levelIndex = index * 6 + i;
                        if (levelIndex < addAlertController.levelsList.length) {
                          int levelValue = addAlertController.levelsList[
                              levelIndex]; // Get the actual level value
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                addAlertController.selectedLevel.value =
                                    levelValue;
                                print(addAlertController.selectedLevel.value);
                              },
                              child: Obx(
                                () => Container(
                                  margin: EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: addAlertController
                                                .selectedLevel.value ==
                                            levelValue
                                        ? AppColors.darkpurplecolor1
                                        : AppColors.white,
                                    border: Border.all(
                                      color: addAlertController
                                                  .selectedLevel.value ==
                                              levelValue
                                          ? AppColors.darkpurplecolor1
                                          : AppColors.greycolor2,
                                    ),
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                  child: Obx(
                                    () => Text(
                                        addAlertController
                                            .levelsList[levelIndex]
                                            .toString(),
                                        style: AppTextStyle.medium13TitleStyle
                                            .copyWith(
                                          color: addAlertController
                                                      .selectedLevel.value ==
                                                  levelValue
                                              ? Colors.white
                                              : Colors.black,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                              child:
                                  SizedBox()); // Placeholder for missing elements
                        }
                      }),
                    ),
                  );
                },
                itemCount: (addAlertController.levelsList.length / 6).ceil(),
                control: const SwiperControl(
                    padding: EdgeInsets.all(8.0),
                    iconPrevious: Icons.arrow_back_ios_new_rounded,
                    iconNext: Icons.arrow_forward_ios_rounded,
                    size: 20,
                    color: AppColors.greycolor2),
                viewportFraction: 0.85, // Adjusts the spacing between items
              ),
            ),
          ]),
    );
  }
}

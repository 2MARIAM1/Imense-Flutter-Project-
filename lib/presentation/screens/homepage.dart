import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/core/constants/assets_paths.dart';
import 'package:imense_project/core/shared_components/customs/custom_charts_container.dart';
import 'package:imense_project/presentation/controllers/home_controller.dart';
import 'package:imense_project/presentation/screens/addalertform.dart';
import 'package:imense_project/presentation/widgets/bar_chart_container.dart';
import 'package:imense_project/presentation/widgets/filter_container.dart';
import 'package:imense_project/presentation/widgets/pie_chart/pie_chart_container.dart';
import 'package:imense_project/presentation/widgets/stats_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lightbackgroundgreycolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 1,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: null,
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 10),
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Overview",
                      style: AppTextStyle.mediumTitleStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.basicblackcolor),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: AppColors.greycolor),
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundImage: AssetImage(AssetsPaths.profileimage),
                    radius: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // STATS
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    StatsContainer(
                      title: "My observations", value: "150",
                      backgroundIconColor: AppColors.lightbluecolor,
                      // iconColor: AppColors.bluecolor2,
                      svgPath: AssetsPaths.observationIcon,
                    ),
                    StatsContainer(
                      title: "Pending",
                      value: "4",
                      backgroundIconColor: AppColors.lightbluecolor,
                      iconColor: AppColors.bluecolor2,
                      icon: Icons.pause_rounded,
                    ),
                    StatsContainer(
                      title: "Progress",
                      value: "1",
                      backgroundIconColor: AppColors.lightyellowcolor,
                      svgPath: AssetsPaths.progressIcon,
                    ),
                    StatsContainer(
                      title: "Resolved",
                      value: "2",
                      backgroundIconColor: AppColors.lightgreencolor,
                      iconColor: AppColors.greencolor,
                      icon: Icons.check_rounded,
                    ),
                    StatsContainer(
                      title: "Closed",
                      value: "1",
                      backgroundIconColor: AppColors.lightgrey2,
                      svgPath: AssetsPaths.lockIcon,
                    ),
                  ],
                )),
          ),

          // FILTERS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => Row(
                  children: homeController.fakeTitles.map((title) {
                    return FilterContainer(
                      title: title,
                      onPressed: () {
                        homeController.removeFilter(title);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          // MY OBSERVATIONS
          CustomChartsContainer(
              customcontent: BarChartContainer(
                data: homeController.barChartData,
              ),
              title: "My Observations",
              subtitle: "Statistics",
              onClear: () {
                homeController.clearFilter();
                Get.back();
              }),

          // PROGRESS
          CustomChartsContainer(
            customcontent: PieChartContainer(),
            title: "Progress",
            subtitle: "Today",
            onClear: () {
              homeController.clearFilter();
              Get.back();
            },
          ),
          SizedBox(
            height: 40,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: AppColors.bluecolor1,
        shape: CircleBorder(),
        onPressed: () {
          Get.to(() => AddAlertPage());
        },
        child: Icon(
          Icons.add_rounded,
          color: AppColors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 3,
        shadowColor: Colors.black,
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Centers the buttons

          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.lightbluegrey,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: IconButton(
                      icon: SvgPicture.asset(AssetsPaths.homeIcon
                          // color: iconColor,
                          ),
                      onPressed: () {},
                    ))),
              ),
            ),
            Spacer(),
            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.lightgrey,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: IconButton(
                      icon: SvgPicture.asset(AssetsPaths.observationIconG
                          // color: iconColor,
                          ),
                      onPressed: () {},
                    ))),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.lightgrey,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: IconButton(
                      icon: SvgPicture.asset(AssetsPaths.reportIcon
                          // color: iconColor,
                          ),
                      onPressed: () {},
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

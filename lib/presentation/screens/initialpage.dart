import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:imense_project/core/constants/app_colors.dart';
import 'package:imense_project/core/constants/app_styles.dart';
import 'package:imense_project/core/constants/assets_paths.dart';
import 'package:imense_project/presentation/screens/homepage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(
        () => HomePage(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: AppColors.darkpurplecolor2,
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              AssetsPaths.constructionimage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: SvgPicture.asset(AssetsPaths.logo),
        )
      ],
    ));
  }
}

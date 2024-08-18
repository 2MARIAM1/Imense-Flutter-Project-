import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imense_project/configs/routes/page_routes.dart';
import 'package:imense_project/presentation/bindings/addalertbinding.dart';
import 'package:imense_project/presentation/bindings/homebinding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HomeBindings().dependencies();
  AddAlertBindings().dependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: PageRoutes.routes,
      initialRoute: PageRoutes.initialroute,
    );
  }
}

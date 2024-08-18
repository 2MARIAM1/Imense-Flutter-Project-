import 'package:get/get.dart';
import 'package:imense_project/presentation/bindings/homebinding.dart';
import 'package:imense_project/presentation/bindings/addalertbinding.dart';
import 'package:imense_project/presentation/screens/addalertform.dart';
import 'package:imense_project/presentation/screens/homepage.dart';
import 'package:imense_project/presentation/screens/initialpage.dart';

class PageRoutes {
  static const initialroute = '/intialpage';
  static const homeroute = '/home';
  static const addalertroute = '/addalert';
  static final routes = [
    GetPage(
      name: PageRoutes.initialroute,
      title: PageNames.initialroute,
      page: () => InitialPage(),
    ),
    GetPage(
      name: PageRoutes.homeroute,
      title: PageNames.homeroute,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: PageRoutes.addalertroute,
      title: PageNames.addalertroute,
      page: () => AddAlertPage(),
      binding: AddAlertBindings(),
    ),
  ];
}

class PageNames {
  static const initialroute = 'intialpage';
  static const homeroute = 'home';
  static const addalertroute = 'addalert';
}

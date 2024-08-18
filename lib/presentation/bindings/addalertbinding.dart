import 'package:get/get.dart';
import 'package:imense_project/presentation/controllers/addalert_controller.dart';

class AddAlertBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAlertController(), fenix: true);
  }
}

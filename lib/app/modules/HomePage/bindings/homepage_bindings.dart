import 'package:get/get.dart';
import 'package:vyld/app/modules/HomePage/controller/homepage_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

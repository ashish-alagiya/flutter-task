import 'package:flutter_assignment_app/pages/my_information/presentation/controller/my_information_controller.dart';
import 'package:get/get.dart';

class MyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInformationController>(() => MyInformationController());
  }
}

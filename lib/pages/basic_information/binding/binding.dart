import 'package:flutter_assignment_app/pages/basic_information/presentation/controller/basic_information_controller.dart';
import 'package:get/get.dart';

class BasicInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicInformationController>(() => BasicInformationController());
  }
}

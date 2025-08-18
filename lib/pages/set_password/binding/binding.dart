import 'package:flutter_assignment_app/pages/set_password/presentation/controller/set_password_controller.dart';
import 'package:get/get.dart';

class SetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPasswordController>(() => SetPasswordController());
  }
}

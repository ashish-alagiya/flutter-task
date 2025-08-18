import 'package:flutter/cupertino.dart';
import 'package:flutter_assignment_app/components/custom_snack_bar.dart';
import 'package:get/get.dart';

class SetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void handlePasswordChange() {
    if (formKey.currentState!.validate()) {
      SnackBarUtil.success('비밀번호가 성공적으로 저장되었습니다');
    }
  }
}

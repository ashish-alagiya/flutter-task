import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicInformationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nicknameController = TextEditingController();
  final instantIdController = TextEditingController();
  final urlController = TextEditingController();
  final portfolioController = TextEditingController();
  @override
  void dispose() {
    idController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nicknameController.dispose();
    instantIdController.dispose();
    urlController.dispose();
    portfolioController.dispose();
    super.dispose();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/service/image_picker.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString userName = "홍길동님".obs;
  RxInt requests = 0.obs;
  RxInt inProgress = 0.obs;
  RxInt completed = 0.obs;
  File? selectedImage;

  void updateUser(String name) {
    userName.value = name;
  }

  Future<void> pickImage(BuildContext context) async {
    File? pickedFile = await ImagePickerService.showPickerDialog(context);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtil {
  static void success(String message) {
    show(
      title: "Success",
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  static void error(String message) {
    show(
      title: "Error",
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  static void warning(String message) {
    show(
      title: "Warning",
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  static void show({
    required String title,
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 4),
    IconData? icon,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
      snackPosition: position,
      duration: duration,
      icon: icon != null ? Icon(icon, color: textColor) : null,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
    );
  }
}

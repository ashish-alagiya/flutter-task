import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  /// Pick image from camera or gallery
  static Future<File?> pickImage({
    required BuildContext context,
    bool fromCamera = false,
  }) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 80, // reduce quality for smaller size
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    } catch (e) {
      debugPrint("ImagePickerService Error: $e");
    }
    return null;
  }

  /// Show dialog to choose between camera or gallery
  static Future<File?> showPickerDialog(BuildContext context) async {
    return showModalBottomSheet<File?>(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () async {
                  final file = await pickImage(
                    context: context,
                    fromCamera: false,
                  );
                  Navigator.pop(context, file);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  final file = await pickImage(
                    context: context,
                    fromCamera: true,
                  );
                  Navigator.pop(context, file);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

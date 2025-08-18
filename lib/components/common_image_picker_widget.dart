import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/constants/assets.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class CommonImagePicker extends StatelessWidget {
  final double size;
  final VoidCallback? pickImage;
  final File? selectedImage;
  const CommonImagePicker({
    super.key,
    this.size = 100,
    this.pickImage,
    this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: AppColors.lightGreyColor,
        backgroundImage:
            selectedImage != null ? FileImage(selectedImage!) : null,
        child:
            selectedImage == null
                ? Container(
                  width: height_80,
                  height: height_80,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          width: height_18,
                          height: height_18,
                          cameraIcon,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: height_4),
                        Text(
                          "이미지 등록",
                          style: textStyleHeading().copyWith(
                            fontSize: font_12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}

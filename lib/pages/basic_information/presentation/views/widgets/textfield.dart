  import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/common_textfield.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';

Widget buildTextField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    bool isRequired = false,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + (isRequired ? ' *' : ''),
          style: textStyleHeading().copyWith(
            fontSize: font_14,
            fontWeight: FontWeight.w500,
            color: AppColors.textBlackColor,
          ),
        ),
        SizedBox(height: height_8),
        CommonTextField(
          hintText: hintText.toString(),
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
        ),
      ],
    );
  }

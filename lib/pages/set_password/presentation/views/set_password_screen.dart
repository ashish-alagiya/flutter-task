import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/animation.dart';
import 'package:flutter_assignment_app/components/common_textfield.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_assignment_app/constants/validations.dart';
import 'package:flutter_assignment_app/pages/set_password/presentation/controller/set_password_controller.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetPasswordController>(
      init: SetPasswordController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back(),
            ),
          ),
          body: FadeAnimationTransition(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: width_20),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height_20),
                            Text(
                              '비밀번호 설정',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: font_28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: height_40),

                            // Current Password Field
                            Text(
                              '기존 비밀번호 *',
                              style: TextStyle(
                                fontSize: font_14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: height_8),
                            CommonTextField(
                              hintText: '8-16자리 영문, 숫자, 특수문자 조합',
                              controller: controller.currentPasswordController,
                              obscureText: false,
                              isPassword: false,
                              validator: (value) {
                                return validatePassword(
                                  value,
                                  controller.currentPasswordController.text,
                                );
                              },
                            ),
                            SizedBox(height: height_24),

                            Text(
                              '새 비밀번호 *',
                              style: textStyleHeading().copyWith(
                                fontSize: font_14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlackColor,
                              ),
                            ),
                            SizedBox(height: height_8),
                            CommonTextField(
                              hintText: '8-16자리 영문, 숫자, 특수문자 조합',
                              obscureText: false,
                              isPassword: false,
                              controller: controller.newPasswordController,
                              validator: (value) {
                                return validatePassword(
                                  value,
                                  controller.newPasswordController.text,
                                );
                              },
                            ),
                            SizedBox(height: height_24),

                            Text(
                              '비밀번호 확인 *',
                              style: textStyleHeading().copyWith(
                                fontSize: font_14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlackColor,
                              ),
                            ),
                            SizedBox(height: height_8),
                            CommonTextField(
                              hintText: '비밀번호를 한 번더 입력해 주세요.',
                              obscureText: false,
                              isPassword: false,
                              controller: controller.confirmPasswordController,
                              validator: (value) {
                                return validatePassword(
                                  value,
                                  controller.newPasswordController.text,
                                  isConfirm: true,
                                );
                              },
                            ),

                            // Add extra space at the bottom for better scrolling experience
                            SizedBox(height: height_100),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Fixed bottom button section
                  Container(
                    padding: EdgeInsets.all(width_20),
                    child: Container(
                      width: double.infinity,
                      height: height_50,
                      child: ElevatedButton(
                        onPressed: controller.handlePasswordChange,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          '확인',
                          style: textStyleHeading().copyWith(
                            fontSize: font_16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/animation.dart';
import 'package:flutter_assignment_app/components/common_textfield.dart';
import 'package:flutter_assignment_app/components/custom_snack_bar.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_assignment_app/constants/validations.dart';
import 'package:flutter_assignment_app/pages/basic_information/presentation/controller/basic_information_controller.dart';
import 'package:get/get.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({super.key});

  Widget _buildTextField({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: FadeAnimationTransition(
        child: GetBuilder<BasicInformationController>(
          init: BasicInformationController(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '기본정보',
                      style: textStyleHeading().copyWith(
                        fontSize: font_28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height_20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTextField(
                              label: '아이디',
                              controller: controller.idController,
                              hintText: 'asdf123',
                              isRequired: true,
                              validator:
                                  (value) => validateRequired(value, '아이디'),
                            ),
                            SizedBox(height: height_24),

                            _buildTextField(
                              label: '이메일',
                              controller: controller.emailController,
                              hintText: 'asdf123@naver.com',
                              isRequired: true,
                              validator: validateEmail,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: height_24),
                            Text(
                              '휴대폰 번호'
                              ' *',
                              style: textStyleHeading().copyWith(
                                fontSize: font_14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlackColor,
                              ),
                            ),
                            SizedBox(height: height_8),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: controller.phoneController,

                              validator: validatePhone,
                              keyboardType: TextInputType.phone,

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.whiteColor,
                                hintText: '010-1234-5678',
                                hintStyle: TextStyle(color: Colors.grey[400]),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.lightGreyColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.lightGreyColor,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.redColor,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                suffixIcon: Container(
                                  margin: EdgeInsets.all(4),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle phone verification
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text('인증번호가 발송되었습니다'),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      elevation: 0,
                                      minimumSize: Size(60, 36),
                                    ),
                                    child: Text(
                                      '번호인증',
                                      style: textStyleHeading().copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: font_12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: width_5),
                                Column(children: []),
                              ],
                            ),
                            SizedBox(height: height_24),

                            _buildTextField(
                              label: '닉네임',
                              controller: controller.nicknameController,
                              hintText: '장발산',
                              isRequired: true,
                              validator:
                                  (value) => validateRequired(value, '닉네임'),
                            ),
                            SizedBox(height: height_24),

                            _buildTextField(
                              label: '인스타그램 아이디',
                              controller: controller.instantIdController,
                              hintText: 'ffxdo_sa',
                            ),
                            SizedBox(height: height_24),

                            _buildTextField(
                              label: '대표 작업 링크',
                              controller: controller.urlController,
                              hintText: 'https://www.naver.com/',
                              validator: validateUrl,
                              keyboardType: TextInputType.url,
                            ),
                            SizedBox(height: height_24),

                            _buildTextField(
                              label: '포트폴리오',
                              controller: controller.portfolioController,
                              hintText: '포트폴리오.pdf',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.attach_file,
                                  color: Colors.grey[400],
                                ),
                                onPressed: () {
                                  SnackBarUtil.warning(
                                    '파일 첨부 기능은 실제 앱에서 구현됩니다',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            SnackBarUtil.success('정보가 성공적으로 저장되었습니다');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text(
                          '저장하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

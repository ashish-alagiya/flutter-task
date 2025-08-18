import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/animation.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_assignment_app/routes/app_routes.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyInformationScreen extends StatelessWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '내정보',
                style: textStyleHeading().copyWith(
                  fontSize: font_28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height_20),

              _buildSettingsItem(
                title: '기본 정보',
                onTap: () {
                  Get.toNamed(AppRoutes.basicInformationScreen);
                },
              ),

              _buildSettingsItem(
                title: '비밀번호 설정',
                onTap: () {
                  Get.toNamed(AppRoutes.setPasswordScreen);
                },
              ),

              _buildSettingsItem(title: '관심 카테고리', onTap: () {}),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.dividerColor, width: 1),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: textStyleHeading().copyWith(
            fontSize: font_16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: height_14),
        contentPadding: EdgeInsets.symmetric(vertical: height_8),
        onTap: onTap,
      ),
    );
  }
}

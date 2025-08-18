import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/animation.dart';
import 'package:flutter_assignment_app/components/common_image_picker_widget.dart';
import 'package:flutter_assignment_app/constants/assets.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_assignment_app/pages/profile/presentation/controller/profile_controller.dart';
import 'package:flutter_assignment_app/routes/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: FadeAnimationTransition(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width_20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height_20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "안녕하세요,",
                              style: textStyleHeading().copyWith(
                                fontSize: font_20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.userName.value,
                                style: textStyleHeading().copyWith(
                                  fontSize: font_28,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: CommonImagePicker(
                            size: height_80,
                            pickImage: () {
                              controller.pickImage(context);
                            },
                            selectedImage: controller.selectedImage,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height_30),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreyContainerColor,
                        borderRadius: BorderRadius.circular(radius_12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(height_12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "나의 캠페인",
                                  style: textStyleHeading().copyWith(
                                    fontSize: font_12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: AppColors.textBlackColor,
                                ),
                              ],
                            ),
                            SizedBox(height: height_18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Obx(
                                  () => _TaskStatus(
                                    title: "신청",
                                    count: controller.requests.value,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: AppColors.greyColor,
                                ),
                                Obx(
                                  () => _TaskStatus(
                                    title: "진행중",
                                    count: controller.inProgress.value,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: AppColors.greyColor,
                                ),
                                Obx(
                                  () => _TaskStatus(
                                    title: "완료",
                                    count: controller.completed.value,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: height_20),

                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _MenuTile(
                            icon: personIcon,
                            title: "내 정보",
                            ontap: () {
                              Get.toNamed(AppRoutes.myInformationScreen);
                            },
                          ),
                          const _MenuTile(icon: notesIcon, title: "공지사항"),
                          const _MenuTile(icon: messagesIcon, title: "1:1문의"),
                          const _MenuTile(icon: faqIcon, title: "FAQ"),
                          const _MenuTile(icon: taskListIcon, title: "약관 및 정책"),
                          const _MenuTile(icon: logoutIcon, title: "로그아웃"),
                          const _MenuTile(icon: deleteIcon, title: "회원탈퇴"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TaskStatus extends StatelessWidget {
  final String title;
  final int count;
  const _TaskStatus({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$count",
          style: textStyleHeading().copyWith(
            fontSize: font_20,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: height_4),
        Text(title, style: textStyleHeading().copyWith(fontSize: font_14)),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? ontap;
  const _MenuTile({required this.icon, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            width: height_18,
            height: height_18,
            icon,
            color: AppColors.textBlackColor,
            fit: BoxFit.fill,
          ),
          title: Text(
            title,
            style: textStyleHeading().copyWith(
              fontSize: font_14,
              fontWeight: FontWeight.w100,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: height_14),
          onTap: ontap,
        ),
        const Divider(color: AppColors.dividerColor),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/components/animation.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';
import 'package:flutter_assignment_app/pages/campaign_matching/presentation/views/widgets/compaign_card.dart'
    show CampaignList;
import 'package:flutter_assignment_app/routes/app_routes.dart';
import 'package:get/get.dart';

class CampaignMatchingScreen extends StatelessWidget {
  const CampaignMatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: width_20),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width_20),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.person),
                onPressed: () {
                  Get.toNamed(AppRoutes.profileScreen);
                },
              ),
            ),
          ],
        ),
        body: FadeAnimationTransition(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width_20),
                child: Text(
                  "캠페인 매칭",
                  style: textStyleHeading().copyWith(fontSize: font_28),
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primaryColor,
                dividerColor: AppColors.lightGreyColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: height_3,

                labelStyle: textStyleHeading().copyWith(
                  fontSize: font_16,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "신청"),
                  Tab(text: "진행중"),
                  Tab(text: "완료"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [CampaignList(), CampaignList(), CampaignList()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

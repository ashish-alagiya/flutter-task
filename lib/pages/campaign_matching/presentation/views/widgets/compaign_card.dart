import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/constants/assets.dart';
import 'package:flutter_assignment_app/constants/colors.dart';
import 'package:flutter_assignment_app/constants/dimens.dart';
import 'package:flutter_assignment_app/constants/text_style.dart';

class CampaignList extends StatelessWidget {
  CampaignList({super.key});
  final List<Map<String, String>> items = [
    {
      "image": cateImage1,
      "title": "회사명 나오는 자리",
      "subtitle": "소개 및 나오는 자리입니다! 연결만 나오나봐요",
      "tags": "F&B, 라이프, 리뷰어모집 , 리빙/인테리어",
    },
    {
      "image": cateImage2,
      "title": "회사명 나오는 자리",
      "subtitle": "소개 및 나오는 자리입니다! 연결만 나오나봐요",
      "tags": "F&B, 라이프, 리뷰어모집 , 리빙/인테리어",
    },
    {
      "image": cateImage3,
      "title": "회사명 나오는 자리",
      "subtitle": "소개 및 나오는 자리입니다! 연결만 나오나봐요",
      "tags": "F&B, 라이프, 리뷰어모집 , 리빙/인테리어",
    },
    {
      "image": cateImage4,
      "title": "회사명 나오는 자리",
      "subtitle": "소개 및 나오는 자리입니다! 연결만 나오나봐요",
      "tags": "F&B, 라이프, 리뷰어모집 , 리빙/인테리어",
    },
    {
      "image": cateImage5,
      "title": "회사명 나오는 자리",
      "subtitle": "소개 및 나오는 자리입니다! 연결만 나오나봐요",
      "tags": "F&B, 라이프, 리뷰어모집 , 리빙/인테리어",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: width_20, vertical: height_30),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: height_15),
      itemBuilder: (context, index) {
        final item = items[index];
        return CampaignCard(
          imageUrl: item["image"]!,
          title: item["title"]!,
          subtitle: item["subtitle"]!,
          tags: item["tags"]!.split(", "),
        );
      },
    );
  }
}

class CampaignCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final List<String> tags;

  const CampaignCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius_12),
              bottomLeft: Radius.circular(radius_12),
            ),
            child: Image.asset(
              imageUrl,
              width: height_100,
              height: height_100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: width_10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyleHeading().copyWith(
                    fontSize: font_14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height_4),
                Text(
                  subtitle,
                  maxLines: 1,
                  style: textStyleHeading().copyWith(
                    fontSize: font_14,
                    fontWeight: FontWeight.w100,
                    color: AppColors.greyColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(height: height_28),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        tags.map((tag) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: width_4),
                            child: Chip(
                              label: Text(
                                tag,
                                style: textStyleHeading().copyWith(
                                  fontSize: font_10,
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              backgroundColor: Color(0xffF8F3FE),
                              side: BorderSide.none,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

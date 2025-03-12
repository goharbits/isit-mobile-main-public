import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class AvailedServiceViewContainer extends StatelessWidget {
  final String title;
  final String service;
  final String rating;
  final String reviewCount;
  final String date;
  final String status;
  final String imageUrl;
  final VoidCallback onPress;

  const AvailedServiceViewContainer(
      {super.key,
        required this.title,
        required this.service,
        required this.rating,
        required this.reviewCount,
        required this.date,
        required this.status,
        required this.imageUrl,
        required this.onPress
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p8, horizontal: AppPadding.p8),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.s30.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.12),
                  offset: Offset(0, 2.63.h),
                  blurRadius: AppSize.s17_2.r,
                  spreadRadius: 0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Home icon with background
            Container(
              height: AppSize.s50.h,
              width: AppSize.s50.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s10.r),
                border: Border.all(
                  color: Colors.transparent,
                  width: AppSize.s1.w,
                ),
              ),
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.darkBlueWithOpacity,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            SizedBox(width: AppSize.s20.w),
            // Other icons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        title,
                        style: getBoldStyle(
                          color: AppColors.darkBlue,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      Text(
                        " | $service | ",
                        style: getMediumStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            rating,
                            style: getBoldStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s12,
                            ),
                          ),
                          Icon(Icons.star, color: Color(0xFFFEC04F),
                          size: 16,)
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "$reviewCount Reviews | ",
                        style: getMediumStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        "$date | ",
                        style: getMediumStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s12,
                        ),
                      ),
                      Text(
                        status,
                        style: getMediumStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class NotificationViewContainer extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final String imageUrl;
  final VoidCallback onPress;

  const NotificationViewContainer(
      {super.key,
        required this.text,
        required this.onPress,
        required this.icon,
        required this.imageUrl,
        required this.title});

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
                  Text(
                    title,
                    style: getMediumStyle(
                      color: AppColors.textColor,
                      fontSize: FontSize.s12,
                    ),
                  ),
                  Text(
                    text,
                    style: getRegularStyle(
                      fontSize: FontSize.s12,
                      color: AppColors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Limits to two lines with ellipsis
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSize.s10.w), // Add space before the timestamp
            Text(
              '1h',
              style: getRegularStyle(color: AppColors.mediumGrey),
            ),
          ],
        ),
      ),
    );
  }
}

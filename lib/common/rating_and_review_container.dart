import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/common/text_styles.dart';

import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class RatingAndReviewContainer extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final String imageUrl;
  final VoidCallback onPress;

  const RatingAndReviewContainer(
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: AppPadding.p8, horizontal: AppPadding.p8),
            decoration: BoxDecoration(
                color: AppColors.pastelBlueColor,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'John Doe',
                                style: getBoldStyle(
                                  color: AppColors.darkBlue,
                                  fontSize: FontSize.s14,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.s5.w,
                              ),
                              Text('|'),
                              SizedBox(
                                width: AppSize.s5.w,
                              ),
                              Text(
                                'Plumber',
                                style: getRegularStyle(
                                  color: AppColors.textColor,
                                  fontSize: FontSize.s12,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.s5.w,
                              ),
                              Text('|'),
                              SizedBox(
                                width: AppSize.s5.w,
                              ),
                              Text(
                                '4.3',
                                style: getRegularStyle(
                                  color: AppColors.textColor,
                                  fontSize: FontSize.s10,
                                ),
                              ),
                              SizedBox(
                                width: AppSize.s2,
                              ),
                              Text(
                                '🌟',
                                style: getMediumStyle(
                                  color: AppColors.textColor,
                                  fontSize: FontSize.s12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '11:31 AM',
                            style: getRegularStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor in, deleniti unde,',
                              style: getRegularStyle(
                                fontSize: FontSize.s12,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: AppSize.s10.w), // Add space before the timestamp
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s10.h,
          ),
        ],
      ),
    );
  }
}

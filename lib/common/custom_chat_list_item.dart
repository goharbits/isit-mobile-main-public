import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/common/text_styles.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../constants/app_fonts.dart';
import '../constants/app_sizes.dart';

class CustomChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String unreadMessages;
  final String time;
  final String imageUrl;
  final VoidCallback onPress;

  const CustomChatListItem(
      {super.key,
      required this.name,
      required this.message,
      required this.unreadMessages,
      required this.time,
      required this.imageUrl,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
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
                  unreadMessages == 0
                      ? SizedBox()
                      : Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 15.w,
                            height: 15.h,
                            decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s30.r)),
                            child: Text(
                              unreadMessages,
                              style: getBoldStyle(
                                  color: AppColors.white,
                                  fontSize: FontSize.s10),
                              textAlign: TextAlign.center,
                            ),
                          ))
                ],
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
                      name,
                      style: getMediumStyle(
                        color: AppColors.textColor,
                        fontSize: FontSize.s12,
                      ),
                    ),
                    Text(
                      message,
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
        SizedBox(
          height: AppSize.s10.h,
        ),
        Divider(
          color: Colors.grey, // Set the color of the divider
          thickness: 1, // Set the thickness of the line
        ),
      ],
    );
  }
}

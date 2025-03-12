import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_sizes.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;
  final bool isEnabled;

  CustomDropdown({super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.selectedItem,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.tr,
          style: getMediumStyle(color: AppColors.labelTextColor),
        ),
        SizedBox(height: AppSize.s5.h),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s22_5.r),
            border: Border.all(width: 1.w, color: AppColors.grey),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.12),
                offset: Offset(0, 2.63.h),
                blurRadius: AppSize.s17_2.r,
                spreadRadius: 0,
              )
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: getRegularStyle(color: AppColors.toggleIcon),
              contentPadding: EdgeInsets.symmetric(
                horizontal:  AppPadding.p15.w,
                vertical:  AppPadding.p12.h,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                borderSide: BorderSide(color: AppColors.grey),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                borderSide: BorderSide(color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                borderSide: BorderSide(color: AppColors.grey),
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
            isExpanded: true,
            dropdownColor: AppColors.white,
            icon: Icon(
              size: 20.w,

              Icons.keyboard_arrow_down,
              color: AppColors.toggleIcon,
            ),
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: getMediumStyle(color: AppColors.textColor),
                ),
              );
            }).toList(),
            onChanged: isEnabled ? onChanged : null,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/text_styles.dart';

import '../app/auth/controller/auth_controller.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isPasswordField;
  final bool isEnabled;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  final IconData? suffixIcon;
  bool readOnly = false;

  CustomTextField({super.key,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
    this.controller,
    this.isEnabled=true,
    this.minLines=1,
    this.maxLines=1,
    this.suffixIcon,
    this.readOnly = false
  });

  final AuthController viewModel = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText.tr,
          style: getMediumStyle(color: AppColors.labelTextColor),
        ),
        SizedBox(height: AppSize.s5.h,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s22_5.r),
              border: Border.all(width: 1.w,color: AppColors.grey),
              boxShadow: [
                BoxShadow(
                    color:AppColors.shadowColor.withOpacity(0.12),
                    offset: Offset(0, 2.63.h),
                    blurRadius: AppSize.s17_2.r,
                    spreadRadius: 0
                )
              ]
          ),
          child: isPasswordField
              ? Obx(
                () => TextFormField(
                  readOnly: readOnly,
              enabled: isEnabled,
              controller: controller,
              minLines: minLines,
              maxLines: maxLines,
              obscureText: viewModel.isPasswordObscured.value,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: getRegularStyle(color: AppColors.toggleIcon),
                contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p15.w,vertical: AppPadding.p15.h),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                    borderSide: BorderSide(
                        color: AppColors.grey
                    )
                ),

                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                    borderSide: BorderSide(
                        color: AppColors.grey
                    )
                ),

                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                    borderSide: BorderSide(
                        color: AppColors.grey
                    )
                ),

                filled: true,
                fillColor: AppColors.white,
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.togglePasswordVisibility();
                  },
                  icon: Icon(
                    viewModel.isPasswordObscured.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.toggleIcon,
                  ),
                ),
              ),
            ),
          )
              : TextFormField(
            readOnly: readOnly,
            controller: controller,
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              suffixIcon: suffixIcon!=null?Icon(suffixIcon): null,
              enabled: isEnabled,
              hintText: hintText,
              hintStyle: getRegularStyle(color: AppColors.toggleIcon),

              contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p15.w,vertical: AppPadding.p15.h),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                  borderSide: BorderSide(
                      color: AppColors.grey
                  )
              ),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                  borderSide: BorderSide(
                      color: AppColors.grey
                  )
              ),

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s22_5.r),
                  borderSide: BorderSide(
                      color: AppColors.grey
                  )
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
            //style: TextStyle(fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}


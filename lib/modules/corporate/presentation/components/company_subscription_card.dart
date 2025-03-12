import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/corporate/data/controller/company_employee_controller.dart';
import 'package:isit_app/modules/corporate/presentation/components/company_custom_card_button.dart';
import 'package:isit_app/modules/corporate/presentation/components/company_custom_plan_button.dart';

import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';

class CompanySubscriptionCard extends StatelessWidget {
  final String name;
  final String buttonText;
  final String description;
  final Color color;
  final bool isActive;

  const CompanySubscriptionCard({
    required this.name,
    required this.buttonText,
    required this.description,
    required this.isActive,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CompanyEmployeeController viewModel =
        Get.put(CompanyEmployeeController());

    return Container(
      height: 151.h,
      width: 151.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(23.73.r),
        border: Border.all(
            color: color == AppColors.white
                ? AppColors.darkBlueWithOpacity
                : Colors.transparent),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: getExtraBoldStyle(
                    color: color == AppColors.white
                        ? AppColors.textColor
                        : AppColors.white),
              ),
              SizedBox(
                height: 8.h,
              ),
              CompanyCustomCardButton(
                onPress: () {},
                text: buttonText,
                backgroundColor: color == AppColors.white
                    ? AppColors.textColor
                    : AppColors.white,
                textColor: color == AppColors.white
                    ? AppColors.white
                    : AppColors.textColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: color == AppColors.white
                        ? AppColors.textColor
                        : AppColors.white),
              ),
            ],
          ),
          isActive
              ? Positioned(
                  bottom: -25,
                  left: 20,
                  right: 20,
                  child: CompanyCustomPlanButton(
                    text: 'Current Plan',
                    onPress: () {},
                  ))
              : SizedBox(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/corporate/presentation/components/company_custom_validity_button.dart';
import 'package:isit_app/modules/corporate/presentation/components/company_subscription_card.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/custom_back_icon.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanySubscriptionScreen extends StatelessWidget {
  const CompanySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s60.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackIcon(),
                      SizedBox(
                        width: AppSize.s45.w,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Subscription',
                          style: getBoldStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.s47.h),
                Column(
                  //clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s50.r),
                          topRight: Radius.circular(AppSize.s50.r),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppSize.s16.w),
                        child: Column(
                          children: [
                            Flexible(
                              child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 20,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  CompanySubscriptionCard(
                                    name: 'John Doe',
                                    buttonText: 'Free Trial',
                                    description:
                                        'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                    isActive: false,
                                    color: AppColors.orange,
                                  ),
                                  CompanySubscriptionCard(
                                    name: 'John Doe',
                                    buttonText: '\$30',
                                    description:
                                        'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                    isActive: false,
                                    color: AppColors.white,
                                  ),
                                  CompanySubscriptionCard(
                                    name: 'John Doe',
                                    buttonText: '\$40',
                                    description:
                                        'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                    isActive: true,
                                    color: AppColors.textColor,
                                  ),
                                  // CompanySubscriptionCard(
                                  //   name: 'John Doe',
                                  //   buttonText: '\$50',
                                  //   description:
                                  //       'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                  //   isActive: false,
                                  //   color: AppColors.white,
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s30.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      child: Text(
                                        'Lorem Ipsum',
                                        style: getBoldStyle(
                                            color: AppColors.textColor,
                                            fontSize: FontSize.s18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    CompanyCustomValidityButton(
                                        onPress: () {},
                                        text: 'Validity 90 days')
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: Text(
                                      'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                      style: getRegularStyle(
                                          color: AppColors.textColor,
                                          fontSize: FontSize.s12),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Lorem Plan',
                                    style: getBoldStyle(
                                        color: AppColors.textColor,
                                        fontSize: FontSize.s18),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: AppSize.s15.w),
                                    child: Text(
                                      'Lorem ipsum dolor sit met consectetur loream elit Blanditiis est?',
                                      style: getRegularStyle(
                                          color: AppColors.textColor,
                                          fontSize: FontSize.s12),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s10.h,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: CompanyCustomValidityButton(
                                    onPress: () {
                                      Get.toNamed(
                                          AppRoutes.companyDashboardScreen);
                                    },
                                    text: 'Proceed'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // BottomBar(
          //   selectedIndex: 1,
          // ),
        ],
      ),
    );
  }
}

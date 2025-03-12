import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/app/auth/forget_password_screen.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/custom_drawer_listtile.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanyDrawer extends StatelessWidget {
  const CompanyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      child: Drawer(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 60.h),
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
              ),
              child: Stack(
                //clipBehavior: Clip.none,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: AppSize.s30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: AppSize.s50.h,
                              width: AppSize.s50.w,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10.r),
                                border: Border.all(
                                  color: AppColors.darkBlue,
                                  width: AppSize.s1.w,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50.r,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s15.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5.w,
                                ),
                                Text(
                                  'John Doe',
                                  style: getBoldStyle(
                                    color: AppColors.white,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                                Text(
                                  'Lorem Ipsum',
                                  style: getRegularStyle(
                                    fontSize: FontSize.s12,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s20.h,
                      ),
                      CustomDrawerListtile(
                          icon: Icons.people,
                          text: 'My Employees',
                          onPress: () {
                            Get.toNamed(AppRoutes.myEmployeesScreen);
                          }),
                      CustomDrawerListtile(
                          icon: Icons.menu_book,
                          text: 'Subscription',
                          onPress: () {
                            Get.toNamed(AppRoutes.subscriptionScreen);
                          }),
                      // CustomDrawerListtile(
                      //     icon: Icons.description,
                      //     text: 'Document Management',
                      //     onPress: () {
                      //       Get.toNamed(AppRoutes.documentManagementScreen);
                      //     }),
                      // CustomDrawerListtile(
                      //     icon: Icons.report,
                      //     text: 'Report Management',
                      //     onPress: () {
                      //       Get.toNamed(AppRoutes.reportManagementScreen);
                      //     }),
                      CustomDrawerListtile(
                          icon: Icons.notifications,
                          text: 'Notification',
                          onPress: () {
                            Get.toNamed(AppRoutes.notificationScreen);
                          }),
                      CustomDrawerListtile(
                          icon: Icons.change_circle,
                          text: 'Password Change',
                          onPress: () {
                            Get.to(() => AppForgetPasswordScreen(
                                title: "Password Change"));
                          }),
                      CustomDrawerListtile(
                          icon: Icons.settings,
                          text: 'Settings',
                          onPress: () {
                            Get.toNamed(AppRoutes.settingsScreen);
                          }),
                      // CustomDrawerListtile(
                      //     icon: Icons.design_services_outlined,
                      //     text: 'My Service',
                      //     onPress: () {
                      //       Get.toNamed(AppRoutes.myServicesScreen);
                      //     }
                      // ),
                      SizedBox(
                        height: AppSize.s20.h,
                      ),
                      CustomDrawerListtile(
                          icon: Icons.logout,
                          text: 'Logout',
                          onPress: () {
                            Get.toNamed(AppRoutes.appSignIn);
                          }),
                    ],
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 60.h,
            //   right: -20.w, // Half of the CircleAvatar's width
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: CircleAvatar(
            //       radius: AppSize.s20.r,
            //       backgroundColor: AppColors.darkBlue,
            //       child: Icon(
            //         Icons.arrow_back_ios,
            //         size: AppSize.s30, // Size of the arrow icon
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

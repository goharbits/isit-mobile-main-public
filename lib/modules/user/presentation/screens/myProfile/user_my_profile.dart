import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/user/data/controller/user_my_profile_controller.dart';
import 'package:isit_app/modules/user/presentation/screens/myProfile/user_edit_my_profile.dart';

import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class UserMyProfile extends StatefulWidget {
  const UserMyProfile({super.key});

  @override
  State<UserMyProfile> createState() => _UserMyProfileState();
}

class _UserMyProfileState extends State<UserMyProfile> {

  final UserMyProfileController profileController = Get.put(UserMyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '  My Profile',
                      style: getBoldStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> UserEditMyProfile());
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(
                        Icons.edit,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              //clipBehavior: Clip.none,
              children: [
                Container(
                  width: Get.width,
                  height: MediaQuery.sizeOf(context).height * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s50.r),
                      topRight: Radius.circular(AppSize.s50.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSize.s20.h),
                          CircleAvatar(
                            backgroundColor: AppColors.grey,
                            minRadius: 50,
                            maxRadius: 50,
                            child: Icon(Icons.person),
                          ),
                          SizedBox(height: AppSize.s20.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'Full Name',
                              hintText: '${profileController.fullName.value}'
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'Email',
                              hintText: '${profileController.email.value}',
                              //controller: emailController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'Social Security Number',
                              hintText: '${profileController.securityNumber.value}',
                              //controller: socialSecurityController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'About Yourself',
                              hintText: '${profileController.aboutYourself.value}',
                              minLines: 5,
                              maxLines: 5,
                              //controller: aboutYourselfController
                          ),
                          SizedBox(
                            height: AppSize.s136,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/user/data/controller/user_my_profile_controller.dart';
import 'package:isit_app/modules/user/presentation/screens/services/api_service_user.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_button.dart';
import '../../../../../common/custom_toast.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class UserEditMyProfile extends StatefulWidget {
  const UserEditMyProfile({super.key});

  @override
  State<UserEditMyProfile> createState() => _UserEditMyProfileState();
}

class _UserEditMyProfileState extends State<UserEditMyProfile> {
  GetStorage box = GetStorage();
  final profileController = Get.find<UserMyProfileController>();
  var profileId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId").toString();
    profileController.resetControllers();
  }

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
                  CustomBackIcon(),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '  Edit Profile',
                      style: getBoldStyle(
                          color: AppColors.textColor, fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(flex: 2),
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
                      padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
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
                              labelText: 'Full Name',
                              hintText: 'Full Name',
                              controller: profileController.fullNameController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Social Security Number',
                              hintText: 'Social Security Number',
                              controller: profileController.socialSecurityController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Email',
                              hintText: 'Email',
                              controller: profileController.emailController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Company Name',
                              hintText: 'Company Name',
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'About Employee',
                              hintText: 'About Employee',
                              minLines: 3,
                              maxLines: 3,
                              controller: profileController.aboutYourselfController),
                          SizedBox(height: AppSize.s30.h),
                          CustomButton(
                            onPress: () async {
                              var response = await ApiServiceUser.updateProfile("/user/profile/${profileId}",
                                  profileController.fullNameController.text,
                                  profileController.emailController.text,
                                  profileController.socialSecurityController.text,
                                  profileController.aboutYourselfController.text);

                              if (response!.status == true) {
                                profileController.saveChanges();
                                Get.back();
                                CustomToast.show(
                                    message: "Profile Updated Successfully",
                                    backgroundColor: Colors.green);
                              }
                            },
                            text: "Save",
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

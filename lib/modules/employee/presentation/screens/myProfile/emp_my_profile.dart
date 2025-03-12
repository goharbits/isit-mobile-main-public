import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/employee/data/controller/emp_my_profile_controller.dart';
import 'package:isit_app/modules/employee/presentation/screens/myProfile/emp_edit_my_profile.dart';

import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class EmpMyProfile extends StatefulWidget {
  const EmpMyProfile({super.key});

  @override
  State<EmpMyProfile> createState() => _ProMyProfileState();
}

class _ProMyProfileState extends State<EmpMyProfile> {

  final EmpMyProfileController profileController = Get.put(EmpMyProfileController());

  Widget _buildServiceContainer(String service) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        service,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
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
                      Get.to(()=> EmpEditMyProfile());
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
                              hintText: '${profileController.fullName.value}',
                              //controller: fullNameController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'Social Security Number',
                              hintText: '${profileController.securityNumber.value}',
                             // controller: socialSecurityController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                            labelText: 'Email',
                            hintText: '${profileController.email.value}',
                            // controller: emailController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                            labelText: 'Company Name',
                            hintText: 'Company Name',
                            // controller: emailController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                            readOnly: true,
                              labelText: 'About Employee',
                              hintText: '${profileController.aboutEmployee.value}',
                              minLines: 5,
                              maxLines: 5,
                             // controller: aboutEmployeeController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          Text("Services"),
                          SizedBox(height: 10),
                          Obx(
                                () => Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: profileController.services
                                  .map((service) => _buildServiceContainer(service.name.toString()))
                                  .toList(),
                            ),
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

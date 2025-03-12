import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/corporate/data/controller/company_my_profile_controller.dart';
import 'package:isit_app/modules/corporate/presentation/screens/myProfile/company_edit_my_profile.dart';

import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class CompanyMyProfile extends StatefulWidget {
  const CompanyMyProfile({super.key});

  @override
  State<CompanyMyProfile> createState() => _CompanyMyProfileState();
}

class _CompanyMyProfileState extends State<CompanyMyProfile> {

  final CompanyMyProfileController profileController = Get.put(CompanyMyProfileController());

  GetStorage box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // companyNameController.text = box.read("name");
    // emailController.text = box.read("email");
    // //locationController.text = box.read("location");
    // phoneController.text = box.read("phoneNo");
    // einNumberController.text = box.read("einNo").toString();
    // taxIdController.text = box.read("taxIdNo");
    // registrationController.text = box.read("registrationNo");
    // workPermitController.text = box.read("workPermit");
    // aboutCompanyController.text = box.read("about");
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
                      //bool value = await
                      Get.to(() => CompanyEditMyProfile(
                        name: profileController.companyNameController.text,
                        email: profileController.emailController.text,
                        phoneNumber: profileController.phoneController.text,
                        einNumber: profileController.einNumberController.text,
                        taxId: profileController.taxIdController.text,
                        registrationNo: profileController.registrationController.text,
                        workPermit: profileController.workPermitController.text,
                        about: profileController.aboutCompanyController.text
                      ));
                      // if(value){
                      //   companyNameController.text = box.read("name");
                      //   emailController.text = box.read("email");
                      //   //locationController.text = box.read("location");
                      //   phoneController.text = box.read("phoneNo");
                      //   einNumberController.text = box.read("einNo").toString();
                      //   taxIdController.text = box.read("taxIdNo");
                      //   registrationController.text = box.read("registrationNo");
                      //   workPermitController.text = box.read("workPermit");
                      //   aboutCompanyController.text = box.read("about");
                      //   if(mounted) setState(() {});
                      // }
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
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                    child: SingleChildScrollView(
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
                              labelText: 'Company Name',
                              hintText: '${profileController.companyName.value}',
                             // controller: profileController.companyNameController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'Email Address',
                              hintText: '${profileController.email.value}',
                              //controller: profileController.emailController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'Location',
                              hintText: '${profileController.location.value}',
                             // controller: profileController.locationController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'Phone Number',
                              hintText: '${profileController.phoneNumber.value}',
                              //controller: profileController.phoneController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'Company EIN Number',
                              hintText: '${profileController.einNumber.value}',
                              //controller: profileController.einNumberController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'Security Details',
                              hintText: '${profileController.taxId.value}',
                             // controller: profileController.taxIdController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s22_5.r),
                                border: Border.all(
                                    width: 1.w, color: AppColors.grey),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.12),
                                      offset: Offset(0, 2.63.h),
                                      blurRadius: AppSize.s17_2.r,
                                      spreadRadius: 0)
                                ]),
                            child: TextFormField(
                              readOnly: true,
                              //controller: profileController.registrationController,
                              decoration: InputDecoration(
                                hintText: "${profileController.registrationNo.value}",
                                hintStyle: getRegularStyle(
                                    color: AppColors.toggleIcon),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15.w,
                                    vertical: AppPadding.p15.h),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                filled: true,
                                fillColor: AppColors.white,
                              ),
                              //style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          SizedBox(height: AppSize.s15.h),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s22_5.r),
                                border: Border.all(
                                    width: 1.w, color: AppColors.grey),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.12),
                                      offset: Offset(0, 2.63.h),
                                      blurRadius: AppSize.s17_2.r,
                                      spreadRadius: 0)
                                ]),
                            child: TextFormField(
                              readOnly: true,
                              //controller: profileController.workPermitController,
                              decoration: InputDecoration(
                                hintText: "${profileController.workPermit.value}",
                                hintStyle: getRegularStyle(
                                    color: AppColors.toggleIcon),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15.w,
                                    vertical: AppPadding.p15.h),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                filled: true,
                                fillColor: AppColors.white,
                              ),
                              //style: TextStyle(fontSize: fontSize),
                            ),
                          ),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              readOnly: true,
                              labelText: 'About Company',
                              hintText: '${profileController.aboutCompany.value}',
                              minLines: 5,
                              maxLines: 5,
                              //controller: profileController.aboutCompanyController
                          ),
                          SizedBox(height: AppSize.s15.h),
                          Text("Supporting Documents"),
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

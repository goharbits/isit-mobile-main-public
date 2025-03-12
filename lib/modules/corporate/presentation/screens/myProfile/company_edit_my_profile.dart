import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/common/custom_back_icon.dart';
import 'package:isit_app/modules/corporate/data/services/api_service_corporate.dart';

import '../../../../../common/custom_toast.dart';
import '../../../../../common/custom_validity_button.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../data/controller/company_my_profile_controller.dart';

class CompanyEditMyProfile extends StatefulWidget {

  String name, email, phoneNumber, einNumber, taxId, registrationNo, workPermit, about;

   CompanyEditMyProfile(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.einNumber,
      required this.taxId,
      required this.registrationNo,
      required this.workPermit,
      required this.about});

  @override
  State<CompanyEditMyProfile> createState() => _CompanyEditMyProfileState();
}

class _CompanyEditMyProfileState extends State<CompanyEditMyProfile> {

  GetStorage box = GetStorage();

  final profileController = Get.find<CompanyMyProfileController>();

  var profileId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId").toString();
    profileController.resetControllers();
    // companyNameController.text = widget.name;
    // emailController.text = widget.email;
    // phoneController.text = widget.phoneNumber;
    // einNumberController.text = widget.einNumber;
    // taxIdController.text = widget.taxId;
    // registrationController.text = widget.registrationNo;
    // workPermitController.text = widget.workPermit;
    // aboutCompanyController.text = widget.about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                              labelText: 'Company Name',
                              hintText: 'Company Name',
                              controller: profileController.companyNameController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Email Address',
                              hintText: 'Email Address',
                              controller: profileController.emailController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Location',
                              hintText: 'Location',
                              controller: profileController.locationController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Phone Number',
                              hintText: 'Phone NUmber',
                              controller: profileController.phoneController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Company EIN Number',
                              hintText: 'Company EIN Number',
                              controller: profileController.einNumberController),
                          SizedBox(height: AppSize.s15.h),
                          CustomTextField(
                              labelText: 'Security Details',
                              hintText: 'Tax Id Number',
                              controller: profileController.taxIdController),
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
                              controller: profileController.registrationController,
                              decoration: InputDecoration(
                                hintText: "Registration Number",
                                hintStyle: getRegularStyle(
                                    color: AppColors.toggleIcon),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15.w,
                                    vertical: AppPadding.p15.h),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
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
                              controller: profileController.workPermitController,
                              decoration: InputDecoration(
                                hintText: "Work Permit Id",
                                hintStyle: getRegularStyle(
                                    color: AppColors.toggleIcon),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p15.w,
                                    vertical: AppPadding.p15.h),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
                                    borderSide:
                                        BorderSide(color: AppColors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s22_5.r),
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
                              labelText: 'About Company',
                              hintText: 'About Company',
                              minLines: 5,
                              maxLines: 5,
                              controller: profileController.aboutCompanyController),
                          SizedBox(height: AppSize.s15.h),
                          Text("Supporting Documents"),
                          SizedBox(height: AppSize.s40.h),
                          CustomValidityButton(
                            onPress: () async {
                              var response = await ApiServiceCorporate.updateProfile("/corporate/profile/${profileId}",
                                  profileController.companyNameController.text,
                                  profileController.phoneController.text,
                                  profileController.emailController.text,
                                  profileController.aboutCompanyController.text,
                                  profileController.einNumberController.text,
                                  profileController.taxIdController.text,
                                  profileController.registrationController.text,
                                  profileController.workPermitController.text);
                              if (response!.status == true) {
                                // box.write("name", profileController.companyNameController.text);
                                // box.write("email", profileController.emailController.text);
                                // box.write("phoneNo", profileController.phoneController.text);
                                // box.write("einNo", profileController.einNumberController.text);
                                // box.write("taxIdNo", profileController.taxIdController.text);
                                // box.write("registrationNo", profileController.registrationController.text);
                                // box.write("workPermit", profileController.workPermitController.text);
                                // box.write("about", profileController.aboutCompanyController.text);

                                //debugPrint("About : ${box.read("about")}");
                                //Get.back(result: true);
                                profileController.saveChanges();
                                Get.back();
                                CustomToast.show(message: "Profile Updated Successfully",
                                    backgroundColor: Colors.green);
                              }
                            },
                            text: "Save",
                            width: MediaQuery.sizeOf(context).width * 1,
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

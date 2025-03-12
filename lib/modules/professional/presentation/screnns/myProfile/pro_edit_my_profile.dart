import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/professional/data/controller/pro_my_profile_controller.dart';
import 'package:isit_app/modules/professional/data/services/api_service_professional.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_button.dart';
import '../../../../../common/custom_toast.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class ProEditMyProfile extends StatefulWidget {
  const ProEditMyProfile({super.key});

  @override
  State<ProEditMyProfile> createState() => _ProEditMyProfileState();
}

class _ProEditMyProfileState extends State<ProEditMyProfile> {
  GetStorage box = GetStorage();
  final profileController = Get.find<ProMyProfileController>();
  var profileId;

  String? professionalCertificatePath;
  String? supportingDocumentPath;

  // Function to pick a document
  Future<void> pickDocument(String type) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'], // Allowed file types
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          if (type == 'certificate') {
            professionalCertificatePath = result.files.single.path!;
          } else if (type == 'supporting') {
            supportingDocumentPath = result.files.single.path!;
          }
        });
      }
    } catch (e) {
      debugPrint('Error picking document: $e');
    }
  }


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
        child: SingleChildScrollView(
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
              SizedBox(height: 50),
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
                                labelText: 'Full Name',
                                hintText: 'Full Name',
                                controller:
                                    profileController.fullNameController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'Email',
                                hintText: 'Email',
                                controller: profileController.emailController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'Social Security Number',
                                hintText: 'Social Security Number',
                                controller:
                                    profileController.socialSecurityController),
                            SizedBox(height: AppSize.s15.h),
                            CustomTextField(
                                labelText: 'About Yourself',
                                hintText: 'About Yourself',
                                minLines: 3,
                                maxLines: 3,
                                controller:
                                    profileController.aboutYourselfController),
                            SizedBox(height: AppSize.s15.h),
                            Text("Professional Certificate"),
                            SizedBox(height: AppSize.s10.h),
                            InkWell(
                              onTap: () => pickDocument('certificate'),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 4)
                                    ]),
                                child: Center(
                                    child: Text(
                                      professionalCertificatePath == null
                                          ? "   Upload Document   "
                                          : "Selected: ${professionalCertificatePath!.split('/').last}",
                                      style: TextStyle(color: Colors.blue),
                                      overflow: TextOverflow.ellipsis,
                                    ),),
                              ),
                            ),
                            SizedBox(height: AppSize.s15.h),
                            Text("Other Supporting Document"),
                            SizedBox(height: AppSize.s10.h),
                            InkWell(
                              onTap: () => pickDocument('supporting'),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade400,
                                          spreadRadius: 1,
                                          blurRadius: 4)
                                    ]),
                                child: Center(
                                    child: Text(
                                      supportingDocumentPath == null
                                          ? "   Upload Document   "
                                          : "Selected: ${supportingDocumentPath!.split('/').last}",
                                      style: TextStyle(color: Colors.blue),
                                      overflow: TextOverflow.ellipsis,
                                    ),),
                              ),
                            ),
                            SizedBox(height: AppSize.s30.h),
                            CustomButton(
                              onPress: () async {
                                var response =
                                    await ApiServiceProfessional.updateProfile(
                                        "/professional/profile/${profileId}",
                                        profileController
                                            .fullNameController.text,
                                        profileController.emailController.text,
                                        profileController
                                            .socialSecurityController.text,
                                        profileController
                                            .aboutYourselfController.text);
          
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
      ),
    );
  }
}

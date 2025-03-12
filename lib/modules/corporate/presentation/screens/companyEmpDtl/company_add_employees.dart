import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isit_app/common/screens/service/add_service.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_doc_select_button.dart';
import '../../../../../common/custom_validity_button.dart';
import '../../../../../common/custome_text_field.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class CompanyAddEmployees extends StatefulWidget {
  const CompanyAddEmployees({super.key});

  @override
  State<CompanyAddEmployees> createState() => _CompanyAddEmployeesState();
}

class _CompanyAddEmployeesState extends State<CompanyAddEmployees> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController securityNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController createPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController aboutEmployeeController = TextEditingController();

  GetStorage box = GetStorage();
  var profileId;

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // Process the selected image
        debugPrint('Camera Image Path: ${image.path}');
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Process the selected image
        debugPrint('Gallery Image Path: ${image.path}');
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
  }

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );
      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        // Process the selected document
        debugPrint('Document Path: ${file.path}');
      }
    } catch (e) {
      debugPrint('Error picking document: $e');
    }
  }

  Widget _buildBottomSheetContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: 375.w,
      height: 350.h, // Height of the bottom sheet
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s5.h,
          ),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    AppAssets.divider,
                    width: AppSize.s70_88.w,
                    height: AppSize.s6,
                  ))),
          SizedBox(
            height: AppSize.s27.h,
          ),
          Text(
            'Add Medical Record',
            style: getBoldStyle(
                color: AppColors.textColor, fontSize: FontSize.s18),
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.camera_alt_rounded,
            text: 'Open Camera',
            onPress: () {
              _pickImageFromCamera();
            },
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.image,
            text: 'Select From Gallery',
            onPress: () {
              _pickImageFromGallery();
            },
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.description,
            text: 'Documents',
            onPress: () {
              _pickDocument();
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s60.h,
            ),
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
                      'Add Employee',
                      style: getBoldStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s47.h,
            ),
            Column(
              //clipBehavior: Clip.none,
              children: [
                Container(
                  width: Get.width,
                  // height: Get.height,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Full Name',
                            hintText: 'Full Name',
                            controller: fullNameController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Social Security Number',
                            hintText: 'Social Security Number',
                            controller: securityNumberController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Email Address',
                            hintText: 'Email Address',
                            controller: emailAddressController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Create Password',
                            hintText: 'Create Password',
                            controller: createPassController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            controller: confirmPassController),
                        SizedBox(height: AppSize.s15.h),
                        CustomTextField(
                            labelText: 'About Employee',
                            hintText: 'About Employee',
                            minLines: 5,
                            maxLines: 5,
                            controller: aboutEmployeeController),

                        SizedBox(height: AppSize.s20.h),

                        Container(
                          width: MediaQuery.sizeOf(context).width * 1,
                          height: 40.h,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: AppColors.shadowColor.withOpacity(0.12),
                                offset: Offset(0, 2.63.h),
                                blurRadius: AppSize.s17_2.r,
                                spreadRadius: 0)
                          ]),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => AddService(userId: -1, corporateId: "$profileId",));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFF3F6FF), // Background color
                              //onPrimary: Colors.white, // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppSize.s40.r),
                                side: BorderSide(
                                    color: AppColors.darkBlue,
                                    width: AppSize.s1.w), // Border color and width
                              ),
                            ),
                            child: Text("Add Service +",
                              style:
                              getSemiBoldStyle(color: AppColors.darkBlue, fontSize: FontSize.s12,),
                            ),
                          ),
                        ),

                        SizedBox(height: AppSize.s20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Profile Picture"),
                            Text("Attached Document"),
                          ],
                        ),
                        SizedBox(height: AppSize.s10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return _buildBottomSheetContent();
                                  },
                                );
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 4
                                    )]
                                ),
                                child: Center(child: Text("   Upload Picture   ",
                                  style: TextStyle(color: AppColors.darkBlue),)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (BuildContext context) {
                                    return _buildBottomSheetContent();
                                  },
                                );
                              },
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(color: Colors.grey),
                                    boxShadow: [BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1,
                                        blurRadius: 4
                                    )]
                                ),
                                child: Center(child: Text("   Upload Document   ",
                                  style: TextStyle(color: AppColors.darkBlue),)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s30.h),
                        CustomValidityButton(
                          onPress: () {},
                          text: 'Proceed', width: MediaQuery.sizeOf(context).width * 1,),
                        SizedBox(
                          height: AppSize.s100,
                        ),
                      ],
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

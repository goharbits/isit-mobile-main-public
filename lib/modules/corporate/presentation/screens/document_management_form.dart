import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/constants/app_assets.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:isit_app/modules/corporate/data/controller/companydrawer_controller.dart';
import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';

import '../../../../common/custom_doc_select_button.dart';
import '../../../../common/custome_text_field.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../data/controller/document_manage_form_controller.dart';

class DocumentManagementFormScreen extends StatelessWidget {
  DocumentManagementFormScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Initialize the DrawerController using GetX
  final CompanyDrawerController drawerController = Get.put(CompanyDrawerController());
  final DocumentManageFormController documentManagementFormViewModel =
      Get.put(DocumentManageFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CompanyDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: AppSize.s41.h,
                          width: AppSize.s41.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSize.s10.r),
                              border: Border.all(
                                  color: AppColors.darkBlue,
                                  width: AppSize.s1.w)),
                          child: IconButton(
                            icon: Icon(Icons.menu, color: AppColors.textColor),
                            onPressed: () {
                              drawerController.openDrawer(_scaffoldKey);
                            },
                          ),
                        ),
                        SizedBox(
                          width: AppSize.s45.w,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Documents Management',
                            style: getBoldStyle(
                                color: AppColors.textColor,
                                fontSize: FontSize.s18),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
                              SizedBox(height: AppSize.s20.h),
                              Container(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: AppSize.s60.h,
                                      width: AppSize.s60.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppSize.s27.r),
                                        border: Border.all(
                                          color: Colors.transparent,
                                          width: AppSize.s1.w,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 50.r,
                                        backgroundColor: Colors.white,
                                        backgroundImage: NetworkImage(
                                          'https://s3-alpha-sig.figma.com/img/fdde/dfb1/87f6f3eae678fd01e503d525a85d2419?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=NMK7d6eopwosZ0JCPruS8sE0mpYM813bunnnaRtzFMTVL~gE4w3H7EMQb0LmBmYUcxrsCUDySR1zDedaqds8g~uZ8AXBDCc6u3qt1bBmUo9lcEonHeYsVDftawd539lNUqIi~cPDUKur27ONW~Z9jHj33Sx3evgwGdTiesp1gAyoY~d3kZWiR~FLqI4SKPGVSWcbRhZ03vLy2pSuNE7lpp5vw1DN4DxHyP8oF6b3yMLkTW6cUVbUE2pNHYiVpG5-Ina2tq4Q65~OIm7RiOEQpOvhvPtRK0-c4NL3FRLf~X1RJnWu-IB0Ea7w6nnkSVC6JCtjmrmh3en41draxjb4Qg__',
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppSize.s15.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 5.w,
                                        ),
                                        Text(
                                          'John Doe',
                                          style: getBoldStyle(
                                            color: AppColors.textColor,
                                            fontSize: FontSize.s16,
                                          ),
                                        ),
                                        Text(
                                          'Lorem Ipsum',
                                          style: getRegularStyle(
                                            fontSize: FontSize.s12,
                                            color: AppColors.toggleIcon,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'Full Name',
                                  hintText: 'Albert Flores',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'Phone Number',
                                  hintText: '+92343443112',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'Alternate Phone Number',
                                  hintText: '+92343443112',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'Email Address',
                                  hintText: 'admin@gmail.com',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'Company Name',
                                  hintText: 'Lorem Company',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'SSN Number',
                                  hintText: '004-998-998',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              CustomTextField(
                                  labelText: 'EIN or Tax Number',
                                  hintText: '004-998-998',
                                  controller: documentManagementFormViewModel
                                      .fullNameController),
                              SizedBox(height: AppSize.s15.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 23.w,
                                          height: 30.h,
                                          child: Icon(
                                            Icons.description,
                                            color: AppColors.darkBlue,
                                          )),
                                      SizedBox(
                                        width: AppSize.s5.w,
                                      ),
                                      Text(
                                        'Lorem Ipsum',
                                        style: getSemiBoldStyle(
                                          fontSize: FontSize.s15,
                                          color: AppColors.labelTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Lorem Ipsum',
                                        style: getSemiBoldStyle(
                                          fontSize: FontSize.s15,
                                          color: AppColors.labelTextColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppSize.s5.w,
                                      ),
                                      Container(
                                          width: 30.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                              color: AppColors.darkBlue,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Icon(
                                            Icons.visibility,
                                            color: AppColors.white,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppSize.s136,
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
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                padding: EdgeInsets.all(AppPadding.p12.w),
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(AppSize.s30.r),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.shadowColor.withOpacity(0.12),
                          offset: Offset(0, 2.63.h),
                          blurRadius: AppSize.s17_2.r,
                          spreadRadius: 0)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Home icon with background
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Other icons
                    Icon(Icons.build, color: Colors.black54),
                    SizedBox(width: 20),
                    Icon(Icons.chat_bubble_outline, color: Colors.black54),
                    SizedBox(width: 20),
                    Icon(Icons.person_outline, color: Colors.black54),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      width: 375.w,
      height: 350.h, // Height of the bottom sheet
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(39.r),
        topLeft: Radius.circular(39.r),
      )),
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
                    width: 70,
                    height: 6,
                  ))),
          SizedBox(
            height: AppSize.s27,
          ),
          Text(
            'Add Medical Record',
            style: getBoldStyle(color: AppColors.textColor, fontSize: 18),
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.camera_alt_rounded,
            text: 'Open Camera',
            onPress: () {},
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.image,
            text: 'Select From Gallery',
            onPress: () {},
          ),
          SizedBox(height: AppSize.s10.w),
          CustomDocumentSelectButton(
            icon: Icons.description,
            text: 'Documents',
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

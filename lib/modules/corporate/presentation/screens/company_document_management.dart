import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/corporate/presentation/components/company_doc_card.dart';
import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';

import '../../../../common/controller/search_list_controller.dart';
import '../../../../common/custom_back_icon.dart';
import '../../../../common/custom_search_bar.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';

class CompanyDocumentManagement extends StatelessWidget {
  CompanyDocumentManagement({super.key});

  final SearchListController dashboardViewModel =
      Get.put(SearchListController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CompanyDrawer(),
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
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackIcon(),
                      SizedBox(
                        width: AppSize.s30.w,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Document Management',
                          style: getBoldStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                // Welcome Header
                SizedBox(
                  height: AppSize.s47.h),

                Stack(
                  clipBehavior: Clip.none,
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
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 20,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: true,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: false,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: false,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: false,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: false,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                  CompanyDocumentCard(
                                    name: 'John Doe',
                                    email: 'John@gmail.com',
                                    phone: '323-343-443',
                                    isActive: false,
                                    servicesCount: 1,
                                    onToggle: (value) {
                                      // Handle active toggle here
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: -20,
                        left: 20,
                        right: 20,
                        child: CustomSearchBar(
                          controller: dashboardViewModel.searchController, hintText: "Search",
                        )),
                  ],
                ),
              ],
            ),
          ),

          //BottomBar(selectedIndex: 1,),
        ],
      ),
    );
  }
}

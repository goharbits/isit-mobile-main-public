// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:isit_app/modules/corporate/data/controller/company_dashboard_controller.dart';
// import 'package:isit_app/modules/corporate/data/controller/companydrawer_controller.dart';
// import 'package:isit_app/modules/corporate/presentation/components/company_employee_card.dart';
// import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';
//
// import '../../../../common/custom_search_bar.dart';
// import '../../../../common/text_styles.dart';
// import '../../../../constants/app_colors.dart';
// import '../../../../constants/app_fonts.dart';
// import '../../../../constants/app_sizes.dart';
//
// class CompanyReportManagement extends StatelessWidget {
//   CompanyReportManagement({super.key});
//
//   final CompanyDashboardController dashboardViewModel =
//       Get.put(CompanyDashboardController());
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Initialize the DrawerController using GetX
//   final CompanyDrawerController drawerController =
//       Get.put(CompanyDrawerController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: CompanyDrawer(),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: AppSize.s20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: AppSize.s41.h,
//                           width: AppSize.s41.w,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(AppSize.s10.r),
//                               border: Border.all(
//                                   color: AppColors.darkBlue,
//                                   width: AppSize.s1.w)),
//                           child: IconButton(
//                             icon: Icon(Icons.menu, color: AppColors.textColor),
//                             onPressed: () {
//                               drawerController.openDrawer(_scaffoldKey);
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           width: AppSize.s30.w,
//                         ),
//                         Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Report Management',
//                             style: getBoldStyle(
//                                 color: AppColors.textColor,
//                                 fontSize: FontSize.s18),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // Welcome Header
//                   SizedBox(
//                     height: AppSize.s47.h,
//                   ),
//                   Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Container(
//                         width: Get.width,
//                         height: Get.height,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(AppSize.s50.r),
//                             topRight: Radius.circular(AppSize.s50.r),
//                           ),
//                         ),
//                         child: Padding(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: AppSize.s16.w),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                   height: AppSize.s60
//                                       .h), // Placeholder for search bar overlap
//                               GridView.count(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 5,
//                                 mainAxisSpacing: 20,
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 children: [
//                                   CompanyEmployeeCard(
//                                     name: 'John Doe',
//                                     email: 'John@gmail.com',
//                                     phone: '323-343-443',
//                                     isActive: true,
//                                     servicesCount: 1,
//                                     onToggle: (value) {
//                                       // Handle active toggle here
//                                     },
//                                   ),
//                                   CompanyEmployeeCard(
//                                     name: 'John Doe',
//                                     email: 'John@gmail.com',
//                                     phone: '323-343-443',
//                                     isActive: false,
//                                     servicesCount: 1,
//                                     onToggle: (value) {
//                                       // Handle active toggle here
//                                     },
//                                   ),
//                                   CompanyEmployeeCard(
//                                     name: 'John Doe',
//                                     email: 'John@gmail.com',
//                                     phone: '323-343-443',
//                                     isActive: false,
//                                     servicesCount: 1,
//                                     onToggle: (value) {
//                                       // Handle active toggle here
//                                     },
//                                   ),
//                                   CompanyEmployeeCard(
//                                     name: 'John Doe',
//                                     email: 'John@gmail.com',
//                                     phone: '323-343-443',
//                                     isActive: false,
//                                     servicesCount: 1,
//                                     onToggle: (value) {
//                                       // Handle active toggle here
//                                     },
//                                   ),
//                                   CompanyEmployeeCard(
//                                     name: 'John Doe',
//                                     email: 'John@gmail.com',
//                                     phone: '323-343-443',
//                                     isActive: false,
//                                     servicesCount: 1,
//                                     onToggle: (value) {
//                                       // Handle active toggle here
//                                     },
//                                   ),
//                                   // CompanyEmployeeCard(
//                                   //   name: 'John Doe',
//                                   //   email: 'John@gmail.com',
//                                   //   phone: '323-343-443',
//                                   //   isActive: false,
//                                   //   servicesCount: 1,
//                                   //   onToggle: (value) {
//                                   //     // Handle active toggle here
//                                   //   },
//                                   // ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           top: -20,
//                           left: 20,
//                           right: 20,
//                           child: CustomSearchBar(
//                             controller: dashboardViewModel.searchController,
//                             hintText: "Search",
//                           )),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Positioned(
//               left: 20,
//               right: 20,
//               bottom: 20,
//               child: Container(
//                 padding: EdgeInsets.all(AppPadding.p12.w),
//                 decoration: BoxDecoration(
//                     color: AppColors.lightGrey,
//                     borderRadius: BorderRadius.circular(AppSize.s30.r),
//                     boxShadow: [
//                       BoxShadow(
//                           color: AppColors.shadowColor.withOpacity(0.12),
//                           offset: Offset(0, 2.63.h),
//                           blurRadius: AppSize.s17_2.r,
//                           spreadRadius: 0)
//                     ]),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Home icon with background
//                     Container(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: AppColors.darkBlue,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(Icons.home, color: Colors.white),
//                           SizedBox(width: 5),
//                           Text(
//                             'Home',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     // Other icons
//                     Icon(Icons.build, color: Colors.black54),
//                     SizedBox(width: 20),
//                     Icon(Icons.chat_bubble_outline, color: Colors.black54),
//                     SizedBox(width: 20),
//                     Icon(Icons.person_outline, color: Colors.black54),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

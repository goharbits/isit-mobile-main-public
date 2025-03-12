import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/screens/chat/chat_list_screen.dart';
import 'package:isit_app/common/screens/requests/requests_screen.dart';
import 'package:isit_app/constants/app_assets.dart';
import 'package:isit_app/modules/corporate/presentation/screens/myProfile/company_my_profile.dart';
import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/bottom_navigationbar.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_strings.dart';
import '../../data/controller/companydrawer_controller.dart';
import '../components/company_dashboard_card.dart';

class CompanyDashboardScreen extends StatefulWidget {
  const CompanyDashboardScreen({super.key});

  @override
  State<CompanyDashboardScreen> createState() => _CompanyDashboardScreenState();
}

class _CompanyDashboardScreenState extends State<CompanyDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Initialize the DrawerController using GetX
  final CompanyDrawerController drawerController =
      Get.put(CompanyDrawerController());

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CompanyDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                                icon: Icon(Icons.menu,
                                    color: AppColors.textColor),
                                onPressed: () {
                                  drawerController.openDrawer(_scaffoldKey);
                                },
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.hello.tr,
                                  style: getRegularStyle(
                                      color: AppColors.toggleIcon),
                                ),
                                Text(
                                  'John Doe',
                                  style: getBoldStyle(
                                      fontSize: FontSize.s16,
                                      color: AppColors.darkBlue),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: AppSize.s41.h,
                          width: AppSize.s41.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: AppColors.darkBlue,
                                  width: AppSize.s1.w)),
                          child: IconButton(
                            icon: Icon(Icons.notifications,
                                color: AppColors.darkBlue),
                            onPressed: () {
                              Get.toNamed(AppRoutes.notificationScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s16.w, vertical: AppSize.s16.w),
                      child: Column(
                        children: [
                          //SizedBox(height: AppSize.s60.h), // Placeholder for search bar overlap
                          Flexible(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 20,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                CompanyDashboardCard(
                                  imageUrl: AppAssets.card1,
                                  title: 'Number of Employees',
                                  count: '10033',
                                ),
                                CompanyDashboardCard(
                                  imageUrl: AppAssets.card2,
                                  title: 'Number of Services',
                                  count: '2005',
                                ),
                                CompanyDashboardCard(
                                  imageUrl: AppAssets.card3,
                                  title: 'Number of Reports',
                                  count: '500',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // BottomBar(
            //   selectedIndex: 0,
            //   index0: () {
            //     Get.toNamed(AppRoutes.companyDashboardScreen);
            //   },
            //   index1: () {
            //     //Get.toNamed(AppRoutes.requestsScreen);
            //     Get.to(() => RequestsScreen(
            //         profileRoute: Get.to(() => CompanyMyProfile())));
            //   },
            //   index2: () {
            //     //Get.toNamed(AppRoutes.chatListScreen);
            //     Get.to(() => ChatListScreen(
            //         profileRoute: Get.to(() => CompanyMyProfile())));
            //   },
            //   index3: () {
            //     Get.to(() => CompanyMyProfile());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

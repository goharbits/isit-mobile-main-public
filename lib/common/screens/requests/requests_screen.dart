import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/requests_card.dart';
import 'package:isit_app/common/screens/chat/chat_list_screen.dart';
import 'package:isit_app/common/screens/requests/requests_detail_screen.dart';
import 'package:isit_app/common/text_styles.dart';

import '../../../../../app/routes/app_routes.dart';
import '../../../../../common/bottom_navigationbar.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../modules/corporate/presentation/widgets/company_drawer.dart';

class RequestsScreen extends StatefulWidget {
  RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                        Spacer(),
                        Text(
                          "Requests",
                          style:
                              getBoldStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
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
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4, // Number of items in the list
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical:
                                            10.0), // Spacing between items
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => RequestsDetailScreen());
                                      },
                                      child: RequestsCard(
                                          name: "John Doe",
                                          service: "Plumber",
                                          hiredBy: "Loream",
                                          date: "8-11-24",
                                        hour: "\$50",
                                      ),
                                    ));
                              },
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
            //   selectedIndex: 1,
            //   index0: () {
            //     Get.toNamed(AppRoutes.companyDashboardScreen);
            //   },
            //   index1: () {
            //     Get.to(() => RequestsScreen(
            //         profileRoute: widget.profileRoute));
            //   },
            //   index2: () {
            //     // Get.toNamed(AppRoutes.chatListScreen);
            //     Get.to(() => ChatListScreen(
            //         profileRoute: widget.profileRoute));
            //   },
            //   index3: () {
            //     widget.profileRoute;
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

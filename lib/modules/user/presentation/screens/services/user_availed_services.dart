import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/modules/user/presentation/components/availed_service_view_container.dart';
import 'package:isit_app/modules/user/presentation/screens/services/user_availed_service_detail.dart';

import '../../../../../common/controller/search_list_controller.dart';
import '../../../../../common/custom_search_bar.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';

class UserAvailedSerices extends StatefulWidget {
  const UserAvailedSerices({super.key});

  @override
  State<UserAvailedSerices> createState() => _UserAvailedSericesState();
}

class _UserAvailedSericesState extends State<UserAvailedSerices> {
  final SearchListController dashboardViewModel =
  Get.put(SearchListController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //drawer: CompanyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppSize.s60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Availed Services',
                style: getBoldStyle(
                    color: AppColors.textColor,
                    fontSize: FontSize.s18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s47.h,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: Get.width,
                height: MediaQuery.sizeOf(context).height * 0.73,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s50.r),
                    topRight: Radius.circular(AppSize.s50.r),
                  ),
                ),
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AvailedServiceViewContainer(
                      title: "John Doe",
                      service: "Plumber",
                      rating: "4.3",
                      reviewCount: "122",
                      date: "8/11/24",
                      status: "Completed",
                      imageUrl: "",
                      onPress: () {
                        Get.to(() => UserAvailedServiceDetail());
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 14);
                  },
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/common/screens/service/add_service.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:isit_app/modules/professional/data/controller/pro_dashboard_controller.dart';
import 'package:isit_app/modules/professional/presentation/screnns/pro_service_detail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/custom_search_bar.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_strings.dart';
import '../../data/controller/pro_drawer_controller.dart';
import '../components/pro_dashboard_card.dart';
import '../widgets/pro_drawer_screen.dart';

class ProDashboardScreen extends StatefulWidget {
  const ProDashboardScreen({super.key});

  @override
  State<ProDashboardScreen> createState() => _ProDashboardScreenState();
}

class _ProDashboardScreenState extends State<ProDashboardScreen> {
  final ProDashboardController dashboardViewModel = Get.put(ProDashboardController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Initialize the DrawerController using GetX
  final ProDrawerController drawerController = Get.put(ProDrawerController());

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
  }

  GetStorage box = GetStorage();

  var profileId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
    profileId = box.read("profileId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ProDrawerScreen(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
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

                // Welcome Header
                SizedBox(
                  height: AppSize.s47.h,
                ),

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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            InkWell(
                              onTap: () {
                                Get.to(()=> AddService(userId: "$profileId", corporateId: "$profileId",));
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: AppColors.darkBlue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(40.0)
                                ),
                                child: Center(child: Text("Add Service +",
                                  style: getBoldStyle(color: AppColors.darkBlue, fontSize: 16),)),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return ProDashboardCard(
                                        text: 'text',
                                        onPress: () {
                                          Get.to(() => ProServiceDetail(serviceName: "Plumber"));
                                        },
                                        icon: Icons.add,
                                        imageUrl:
                                            'https://s3-alpha-sig.figma.com/img/a647/9572/eb06c3ccaa6139ac464e9698907660ad?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz9PbiLskf54pgG2DXnccM9D-TohdT8PADtCnbhdS~LvlWW0yVEdy5pkFfmP3nEqVsdzrGewf7Vu6~1SkbLo5EnQsKadCYdhNQxRNqs4GYJjScC83Fd-KVX5n23YLaT~YVUkSv9tmfvjlLQlneFIJp7QZoAOEVPpSFfi2p9zn4DJpE3raiFsiYjhvmV918k9~bBVuOY00U0pTBbzj~XpyZKAmiBhEm2kbtFhnWIr5JxZ4Hq4akSakHKsGSFZ~1Z0GXesZvQbWN4kmq2Jo5uH08MoSP5KjyCax-ScN7u2zzB6Dmh9DCxc4aP4g~IllhGrbideG~fhL4MiAyJMlmTF-w__',
                                        title: 'title');
                                  }),
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
          // BottomBar(
          //   selectedIndex: 0,
          //   index0: () {
          //     Get.toNamed(AppRoutes.proDashboardScreen);
          //   },
          //   index1: () {
          //     Get.to(() => RequestsScreen();
          //   },
          //   index2: () {
          //     Get.to(() => ChatListScreen(
          //         profileRoute: Get.to(() => ProMyProfile())));
          //   },
          //   index3: () {
          //     Get.to(()=> ProMyProfile());
          //   },
          // ),
        ],
      ),
    );
  }
}

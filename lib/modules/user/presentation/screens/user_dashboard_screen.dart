import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isit_app/common/custom_validity_button.dart';
import 'package:isit_app/constants/app_assets.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:isit_app/modules/user/data/controller/user_drawer_controller.dart';
import 'package:isit_app/modules/user/presentation/components/listview_container.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../common/custom_button.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/map_constants.dart';
import '../../data/controller/user_dashboard_controller.dart';
import '../widgets/user_drawer_screen.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  final UserDashboardController dashboardViewModel =
      Get.put(UserDashboardController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Initialize the DrawerController using GetX
  final UserDrawerController drawerController = Get.put(UserDrawerController());

  TextEditingController priceController = TextEditingController();
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  List<Marker> _marker = [];
  final Set<Polyline> _polylines = {};
  List<LatLng> _polylineCoordinates = [];
  List<LatLng> _latlng = [];

  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
    await Permission.location.request();
    _showModalBottomSheet(context);
  }

  int? selectedRating;
  bool listView = true;

  final List<Map<String, dynamic>> ratings = [
    {"rating": 5, "stars": 5},
    {"rating": 4, "stars": 4},
    {"rating": 3, "stars": 3},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isDismissible: false, // Prevent closing on tapping outside
      enableDrag: false, // Disable drag to dismiss
      builder: (BuildContext context) {
        return _buildBottomSheetContent(context);
      },
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      child: Column(
        children: [
          Divider(
            color: AppColors.darkBlue,
            thickness: 4,
            indent: 150,
            endIndent: 150,
          ),
          SizedBox(height: 20),
          Text(
            "Enable your Location",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Text("Enable location to find the services"),
          Text("you require."),
          SizedBox(height: 20),
          CustomButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: "Search In Area"),
          SizedBox(height: 10),
          CustomButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: "Search Globally"),
        ],
      ),
    );
  }

  final controller = MultiSelectController;

  //final MultiSelectController controller = Get.put(MultiSelectController());

  // void _showMultiSelectDialog(MultiSelectController controller) {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Select Services"),
  //         content: SizedBox(
  //           height: MediaQuery.sizeOf(context).width * 0.6,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: controller.services
  //                   .map((service) => Obx(
  //                         () => CheckboxListTile(
  //                           activeColor: AppColors.darkBlue,
  //                           value:
  //                               controller.selectedServices.contains(service),
  //                           title: Text(service),
  //                           onChanged: (isSelected) {
  //                             controller.toggleService(service);
  //                           },
  //                         ),
  //                       ))
  //                   .toList(),
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           CustomValidityButton(
  //               onPress: () {
  //                 Get.back();
  //               },
  //               text: "Save & Close",
  //               width: MediaQuery.sizeOf(context).width * 0.7),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: UserDrawerScreen(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s20.w),
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
                            icon: Icon(Icons.menu, color: AppColors.textColor),
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
                              style:
                                  getRegularStyle(color: AppColors.toggleIcon),
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
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: AppColors.darkBlue, width: AppSize.s1.w)),
                      child: IconButton(
                        icon: Icon(CupertinoIcons.globe, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            listView = !listView;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s40.h,
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
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s16.w, vertical: 20),
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     _showMultiSelectDialog(controller);
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(horizontal: 12),
                      //     decoration: BoxDecoration(
                      //       border: Border.all(color: AppColors.darkBlue),
                      //       borderRadius: BorderRadius.circular(40.0),
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Obx(() => controller.selectedServices.isEmpty
                      //             ? Padding(
                      //           padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //           child: Text(
                      //             "Select Services",
                      //             style: TextStyle(
                      //                 color: AppColors.darkBlue,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         )
                      //             : Padding(
                      //           padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //           child: Text(
                      //             "Selected Services",
                      //             style: TextStyle(
                      //                 color: AppColors.darkBlue,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         )),
                      //         Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Obx(
                      //       () => Wrap(
                      //     spacing: 8,
                      //     runSpacing: 0,
                      //     children: controller.selectedServices
                      //         .map((service) => Chip(
                      //       label: Text(service),
                      //       side: BorderSide(color: AppColors.darkBlue),
                      //       deleteIcon: Icon(Icons.close),
                      //       onDeleted: () {
                      //         controller.toggleService(service);
                      //       },
                      //     ))
                      //         .toList(),
                      //   ),
                      // ),
                      MultiDropdown<String>(
                        items: [
                          DropdownItem(label: "Carpenter", value: "Carpenter"),
                          DropdownItem(label: 'Designer', value: "Designer"),
                          DropdownItem(label: 'Electrician', value: "Electrician"),
                        ],
                        controller: MultiSelectController(),
                        searchEnabled: false,
                        fieldDecoration: FieldDecoration(
                          borderRadius: 40,
                          suffixIcon: Icon(Icons.arrow_drop_down, color: AppColors.darkBlue,),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.darkBlue),
                          borderRadius: BorderRadius.circular(40)),
                          hintText: 'Select Services',
                          hintStyle: TextStyle(color: AppColors.darkBlue)
                        ),
                        dropdownItemDecoration: DropdownItemDecoration(
                          selectedBackgroundColor: Color(0xFFF3F6FF)
                        ),
                        chipDecoration: ChipDecoration(
                          backgroundColor: Color(0xFFF3F6FF),
                          border: Border.all(color: AppColors.darkBlue)
                        ),

                        onSelectionChange: (selectedItems) {
                          debugPrint("Selected: $selectedItems");
                        },
                      ),

                      SizedBox(height: 8),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkBlue),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Center(
                          child: DropdownButton<int>(
                            value: selectedRating,
                            isExpanded: true,
                            hint: Text(
                              selectedRating == null
                                  ? "Professional Ratings"
                                  : " $selectedRating",
                              style: TextStyle(color: AppColors.darkBlue),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            items: ratings.map((ratingData) {
                              return DropdownMenuItem<int>(
                                value: ratingData["rating"],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${ratingData["rating"]}"),
                                    Row(
                                      children: List.generate(
                                        5,
                                            (index) => Icon(
                                          Icons.star,
                                          size: 20,
                                          color: index < ratingData["stars"]
                                              ? Colors.amber
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedRating = value;
                              });
                            },
                            underline: SizedBox.shrink(),
                            iconEnabledColor: AppColors.darkBlue,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkBlue),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(40),
                                ),
                              ),
                              child: Image.asset(AppAssets.currencyIcon),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width * 0.65,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: priceController,
                                style: TextStyle(color: AppColors.darkBlue),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                              thickness: 1,
                              width: 20,
                              indent: 8,
                              endIndent: 8,
                            ),
                            Text(
                              "hr",
                              style: TextStyle(color: Color(0xFF919191), fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s15.h),
                      listView == true 
                          ? Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: ListView.separated(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return ListviewContainer(
                              title: "John Doe",
                              service: "Plumber",
                              rating: "4.3",
                              reviewCount: "122",
                              date: "8/11/24",
                              status: "Completed",
                              imageUrl: "https://www.shutterstock.com/shutterstock/photos/2254678955/display_1500/stock-photo-successful-mature-businessman-working-inside-office-man-in-business-suit-working-at-workplace-with-2254678955.jpg",
                              onPress: () {
                                // Navigate to detail screen
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 14);
                          },
                        ),
                      )
                      : Container(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: GoogleMap(
                          initialCameraPosition: MapConstants.kGooglePlex,
                          zoomControlsEnabled: false,
                          indoorViewEnabled: true,
                          trafficEnabled: true,
                          mapType: MapType.normal,
                          polylines: _polylines,
                          markers: Set<Marker>.of(_marker),
                          onMapCreated: (GoogleMapController controller) {
                            // controller.setMapStyle(mapTheme);
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

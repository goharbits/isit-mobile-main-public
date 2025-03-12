import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isit_app/modules/corporate/data/models/corporate_emp_list_model.dart';
import 'package:isit_app/modules/corporate/data/services/api_service_corporate.dart';
import 'package:isit_app/modules/corporate/presentation/screens/companyEmpDtl/company_employee_detail.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../common/controller/search_list_controller.dart';
import '../../../../common/custom_back_icon.dart';
import '../../../../common/custom_search_bar.dart';
import '../../../../common/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_sizes.dart';
import '../components/company_employee_card.dart';

class CompanyMyEmployeesScreen extends StatefulWidget {
  const CompanyMyEmployeesScreen({super.key});

  @override
  State<CompanyMyEmployeesScreen> createState() =>
      _CompanyMyEmployeesScreenState();
}

class _CompanyMyEmployeesScreenState extends State<CompanyMyEmployeesScreen> {
  final SearchListController dashboardViewModel =
      Get.put(SearchListController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GetStorage box = GetStorage();

  bool gridView = true;
  var profileId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileId = box.read("profileId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      key: _scaffoldKey,
      //drawer: DrawerScreen(),
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
                  padding: EdgeInsets.symmetric(horizontal: AppSize.s18.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackIcon(),
                      Spacer(),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'My Employees',
                          style: getBoldStyle(
                              color: AppColors.textColor,
                              fontSize: FontSize.s18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: AppSize.s41.h,
                        width: AppSize.s41.w,
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(AppSize.s10.r),
                            border: Border.all(
                                color: AppColors.darkBlue,
                                width: AppSize.s1.w)),
                        child: IconButton(
                          icon: Icon(Icons.person_add_alt,
                              color: AppColors.white),
                          onPressed: () {
                            Get.toNamed(AppRoutes.companyAddEmployeeScreen);
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
                          boxShadow: [BoxShadow(color: Colors.grey)]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s16.w, vertical: 20),
                        child: FutureBuilder<List<DataEmpList>?>(
                            future:
                                ApiServiceCorporate.fetchEmployees("/corporate/$profileId/employee"),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text(
                                        'Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData) {
                                return Center(
                                    child: Text('No employees found.'));
                              } else {
                                final employees = snapshot.data!;
                                return gridView == true ? GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 20,
                                  shrinkWrap: true,
                                  physics:
                                      NeverScrollableScrollPhysics(),
                                  children: employees.map((employee) {
                                    return InkWell(
                                      onTap: () {
                                        Get.to(() => CompanyEmployeeDetail(employeeId: employee.id));
                                      },
                                      child: CompanyEmployeeCard(
                                        name: employee.name ?? 'N/A',
                                        email: employee.email ?? 'N/A',
                                        phone: employee.phoneNo ?? 'N/A',
                                        isActive: true,
                                        servicesCount: employee.services?.length ?? 0,
                                        onToggle: (value) {
                                          //updateEmployeeStatus(employee, value);
                                        },
                                        gridView: gridView,
                                      ),
                                    );
                                  }).toList(), // Convert Iterable to List
                                )
                                : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: employees.length, // Number of items in the list
                                  itemBuilder: (context, index) {
                                    final employee = employees[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical:
                                          10.0), // Spacing between items
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => CompanyEmployeeDetail(employeeId: employee.id));
                                        },
                                        child: CompanyEmployeeCard(
                                            name: employee.name ?? 'N/A',
                                            email: employee.email ?? 'N/A',
                                            phone: employee.phoneNo ?? 'N/A',
                                            isActive: index ==
                                                0, // Example: make the first item active
                                            servicesCount: employee.services?.length ?? 0,
                                            onToggle: (value) {
                                              // Handle active toggle here
                                            },
                                            gridView: gridView),
                                      ),
                                    );
                                  },
                                );
                              }
                            }),
                      ),
                    ),
                    Positioned(
                        top: -20,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 6,
                              child: CustomSearchBar(
                                  controller:
                                      dashboardViewModel.searchController,
                                  hintText: "Search Employee"),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                                child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gridView = !gridView;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: AppColors.darkBlue,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Icon(
                                  gridView == true
                                      ? Icons.list
                                      : Icons.grid_view_sharp,
                                  color: AppColors.white,
                                ),
                              ),
                            ))
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
          //BottomBar(selectedIndex: 1),
        ],
      ),
    );
  }
}

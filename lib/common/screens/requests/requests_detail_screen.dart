import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isit_app/common/custom_back_icon.dart';
import 'package:isit_app/common/text_styles.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../../../../../constants/app_sizes.dart';

class RequestsDetailScreen extends StatefulWidget {
  const RequestsDetailScreen({super.key});

  @override
  State<RequestsDetailScreen> createState() => _RequestsDetailScreenState();
}

class _RequestsDetailScreenState extends State<RequestsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  CustomBackIcon(),
                  Spacer(),
                  Text("Requests",
                      style: getBoldStyle(color: Colors.black, fontSize: 16)),
                  Spacer(),
                ],
              ),
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.85,
              width: MediaQuery.sizeOf(context).width * 1,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.0))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 35, // Adjust size
                            backgroundColor:
                                Colors.grey[200], // Placeholder background
                            child: ClipOval(
                              child: Icon(Icons.person),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                style: getBoldStyle(
                                    color: AppColors.darkBlue, fontSize: 18),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Hired By: ",
                                  style: getBoldStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: 'Laurium',
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "(\$50)",
                                  style: TextStyle(color: AppColors.darkBlue),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '/hr',
                                        style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(6.0),
                            height: 60,
                            width: 100,
                            decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.3",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(Icons.star,
                                      color: Color(0xFFFEC04F),
                                    size: 18,)
                                  ],
                                ),
                                Text(
                                  "122 Reviews",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "About",
                        style: getBoldStyle(
                            color: AppColors.darkBlue, fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSize.s22_5.r),
                            border:
                                Border.all(width: 1.w, color: AppColors.grey),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.shadowColor.withOpacity(0.12),
                                  offset: Offset(0, 2.63.h),
                                  blurRadius: AppSize.s17_2.r,
                                  spreadRadius: 0)
                            ]),
                        child: TextFormField(
                          controller: null,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            prefixIconColor: AppColors.darkBlue,
                            enabled: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p15.w,
                                vertical: AppPadding.p15.h),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s22_5.r),
                                borderSide: BorderSide(color: AppColors.grey)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s22_5.r),
                                borderSide: BorderSide(color: AppColors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s22_5.r),
                                borderSide: BorderSide(color: AppColors.grey)),
                            filled: true,
                            fillColor: AppColors.white,
                          ),
                          //style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(AppSize.s22_5.r),
                            border: Border.all(width: 1.w, color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.shadowColor.withOpacity(0.12),
                                  offset: Offset(0, 2.63.h),
                                  blurRadius: AppSize.s17_2.r,
                                  spreadRadius: 0)
                            ]),
                        child: Row(
                          children: [
                            Text("Tuesday"),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        height: 55,
                        width: MediaQuery.sizeOf(context).width * 1,
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(AppSize.s22_5.r),
                            border: Border.all(
                                width: 1.w, color: AppColors.darkBlue),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      AppColors.shadowColor.withOpacity(0.12),
                                  offset: Offset(0, 2.63.h),
                                  blurRadius: AppSize.s17_2.r,
                                  spreadRadius: 0)
                            ]),
                        child: Center(
                            child: Text(
                          "In Progress",
                          style: getBoldStyle(color: Colors.black, fontSize: 16),
                        )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

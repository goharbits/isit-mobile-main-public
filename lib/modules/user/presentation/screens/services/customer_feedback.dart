import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/custome_text_field.dart';
import 'package:isit_app/modules/user/presentation/screens/user_bottom_navbar.dart';
import 'package:isit_app/modules/user/presentation/screens/user_dashboard_screen.dart';

import '../../../../../common/custom_back_icon.dart';
import '../../../../../common/custom_button.dart';
import '../../../../../common/text_styles.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_sizes.dart';
import '../../../../../constants/app_strings.dart';

class CustomerFeedback extends StatefulWidget {
  const CustomerFeedback({super.key});

  @override
  State<CustomerFeedback> createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback> {

  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.s60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackIcon(),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Customer Feedback',
                      style: getBoldStyle(
                          color: AppColors.textColor,
                          fontSize: FontSize.s18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s30.h,
            ),
            Container(
              padding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
              width: Get.width,
              height: MediaQuery.sizeOf(context).height * 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s50.r),
                  topRight: Radius.circular(AppSize.s50.r),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.grey,
                    minRadius: 40,
                    maxRadius: 40,
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "John Doe",
                    style: getBoldStyle(
                        color: AppColors.darkBlue, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text("Plumber"),
                  SizedBox(height: 20),
                  RatingBar(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 4.5,
                    maxRating: 5,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    minLines: 4,
                    maxLines: 4,
                      labelText: "Leave a Review",
                      hintText: "Leave a Review",
                      controller: reviewController),
                  SizedBox(height: 20),
                  CustomButton(
                      onPress: () {
                        showReviewSubmittedDialog(context);
                      },
                      text: "Submit Review"),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showReviewSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)
            ),
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w,
                vertical: AppPadding.p28.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.reviewStars),
                SizedBox(height: AppSize.s10.h),
                Text(
                  "Thanks you for your",
                  style: getBoldStyle(color: AppColors.textColor),
                ),
                Text(
                  "feedback!",
                  style: getBoldStyle(color: AppColors.textColor),
                ),
                SizedBox(height: AppSize.s40.h),
                CustomButton(
                  onPress: () {
                    Get.offAll(UserBottomNavbar());
                    // Get.offAndToNamed(AppRoutes.appSignIn);
                  },
                  text: "Back to Home page",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
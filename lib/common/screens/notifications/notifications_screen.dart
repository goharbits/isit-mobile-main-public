import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/screens/notifications/customer_request_screen.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../../modules/corporate/presentation/components/notification_view_container.dart';
import '../../custom_back_icon.dart';
import '../../text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //drawer: DrawerScreen(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.s60.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackIcon(),
                      SizedBox(width: AppSize.s45.w,),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Notifications',
                          style: getBoldStyle(color: AppColors.textColor,fontSize: FontSize.s18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.s47.h,),

                Column(
                  //clipBehavior: Clip.none,
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
                        padding: EdgeInsets.symmetric(horizontal: AppSize.s24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSize.s20.h),
                            NotificationViewContainer(
                              icon: Icons.image,
                              text: 'Lorem ipsum dolor, sit amet consect adipisicing elit. Nisi qui officiis et lorem.',
                              title: 'Lorem Ipsum',
                              imageUrl: 'https://s3-alpha-sig.figma.com/img/a647/9572/eb06c3ccaa6139ac464e9698907660ad?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz9PbiLskf54pgG2DXnccM9D-TohdT8PADtCnbhdS~LvlWW0yVEdy5pkFfmP3nEqVsdzrGewf7Vu6~1SkbLo5EnQsKadCYdhNQxRNqs4GYJjScC83Fd-KVX5n23YLaT~YVUkSv9tmfvjlLQlneFIJp7QZoAOEVPpSFfi2p9zn4DJpE3raiFsiYjhvmV918k9~bBVuOY00U0pTBbzj~XpyZKAmiBhEm2kbtFhnWIr5JxZ4Hq4akSakHKsGSFZ~1Z0GXesZvQbWN4kmq2Jo5uH08MoSP5KjyCax-ScN7u2zzB6Dmh9DCxc4aP4g~IllhGrbideG~fhL4MiAyJMlmTF-w__',
                              onPress: (){
                                Get.to(() => CustomerRequestScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),

    );
  }
}


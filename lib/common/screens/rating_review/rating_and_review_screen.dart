import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/constants/app_colors.dart';

import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../custom_back_icon.dart';
import '../../rating_and_review_container.dart';
import '../../text_styles.dart';

class RatingAndReviewScreen extends StatefulWidget {
  const RatingAndReviewScreen({super.key});

  @override
  State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
}

class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                SizedBox(
                  width: AppSize.s30.w,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Rating And Review',
                    style: getBoldStyle(
                        color: AppColors.textColor,
                        fontSize: FontSize.s18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
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
                height: MediaQuery.sizeOf(context).height * 0.81,
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
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return RatingAndReviewContainer(
                              text: 'text',
                              onPress: () {},
                              icon: Icons.add,
                              imageUrl:
                              'https://s3-alpha-sig.figma.com/img/a647/9572/eb06c3ccaa6139ac464e9698907660ad?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz9PbiLskf54pgG2DXnccM9D-TohdT8PADtCnbhdS~LvlWW0yVEdy5pkFfmP3nEqVsdzrGewf7Vu6~1SkbLo5EnQsKadCYdhNQxRNqs4GYJjScC83Fd-KVX5n23YLaT~YVUkSv9tmfvjlLQlneFIJp7QZoAOEVPpSFfi2p9zn4DJpE3raiFsiYjhvmV918k9~bBVuOY00U0pTBbzj~XpyZKAmiBhEm2kbtFhnWIr5JxZ4Hq4akSakHKsGSFZ~1Z0GXesZvQbWN4kmq2Jo5uH08MoSP5KjyCax-ScN7u2zzB6Dmh9DCxc4aP4g~IllhGrbideG~fhL4MiAyJMlmTF-w__',
                              title: 'title');
                        }),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

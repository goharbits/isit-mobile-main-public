import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:isit_app/common/controller/search_list_controller.dart';
import 'package:isit_app/constants/app_colors.dart';
import 'package:isit_app/modules/corporate/presentation/widgets/company_drawer.dart';

import '../../custom_chat_list_item.dart';
import '../../custom_search_bar.dart';
import '../../text_styles.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_sizes.dart';

class ChatListScreen extends StatefulWidget {
  ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final SearchListController dashboardViewModel =
      Get.put(SearchListController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CompanyDrawer(),
      body: SingleChildScrollView(
        child: Column(
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
                  'Chat',
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
                      children: [
                        ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CustomChatListItem(
                                name: 'John Dow',
                                message: 'Lorem Ipsum',
                                unreadMessages: '3',
                                time: '1h',
                                imageUrl:
                                    'https://s3-alpha-sig.figma.com/img/a647/9572/eb06c3ccaa6139ac464e9698907660ad?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xz9PbiLskf54pgG2DXnccM9D-TohdT8PADtCnbhdS~LvlWW0yVEdy5pkFfmP3nEqVsdzrGewf7Vu6~1SkbLo5EnQsKadCYdhNQxRNqs4GYJjScC83Fd-KVX5n23YLaT~YVUkSv9tmfvjlLQlneFIJp7QZoAOEVPpSFfi2p9zn4DJpE3raiFsiYjhvmV918k9~bBVuOY00U0pTBbzj~XpyZKAmiBhEm2kbtFhnWIr5JxZ4Hq4akSakHKsGSFZ~1Z0GXesZvQbWN4kmq2Jo5uH08MoSP5KjyCax-ScN7u2zzB6Dmh9DCxc4aP4g~IllhGrbideG~fhL4MiAyJMlmTF-w__',
                                onPress: () {
                                  //Get.toNamed(AppRoutes.chatMessages);
                                },
                              );
                            }),
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
    );
  }
}

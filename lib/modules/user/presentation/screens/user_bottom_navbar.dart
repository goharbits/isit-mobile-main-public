import 'package:flutter/material.dart';
import 'package:isit_app/common/screens/chat/chat_list_screen.dart';
import 'package:isit_app/modules/user/presentation/screens/myProfile/user_my_profile.dart';
import 'package:isit_app/modules/user/presentation/screens/services/user_availed_services.dart';
import 'package:isit_app/modules/user/presentation/screens/user_dashboard_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../constants/app_colors.dart';

class UserBottomNavbar extends StatefulWidget {
  const UserBottomNavbar({super.key});

  @override
  State<UserBottomNavbar> createState() => _UserBottomNavbarState();
}

class _UserBottomNavbarState extends State<UserBottomNavbar> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  // Define the screens for each tab
  List<Widget> _buildScreens() {
    return [
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => UserDashboardScreen(), // Replace with your screen
          );
        },
      ),
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => UserAvailedSerices(), // Replace with your screen
          );
        },
      ),
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => ChatListScreen(), // Replace with your screen
          );
        },
      ),
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => UserMyProfile(), // Replace with your screen
          );
        },
      ),
    ];
  }

  // Define the items for the navigation bar
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: "Home",
        activeColorPrimary: AppColors.darkBlue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: "Services",
        activeColorPrimary: AppColors.darkBlue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat_outlined),
        title: "Chat",
        activeColorPrimary: AppColors.darkBlue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: AppColors.darkBlue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      //bottomScreenMargin: 50,
      navBarHeight: 80,
      margin: EdgeInsets.only(bottom: 10, left: 6, right: 6),
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(40.0),
          colorBehindNavBar: Colors.white
      ),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Color(0xFFF1F1F5), // Default navbar background color
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style7, // Style 7 for the bottom navigation bar
    );
  }
}

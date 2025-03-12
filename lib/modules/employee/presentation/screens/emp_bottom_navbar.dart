import 'package:flutter/material.dart';
import 'package:isit_app/common/screens/chat/chat_list_screen.dart';
import 'package:isit_app/modules/employee/presentation/screens/emp_dashboard_screen.dart';
import 'package:isit_app/modules/employee/presentation/screens/myProfile/emp_my_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../common/screens/requests/requests_screen.dart';
import '../../../../constants/app_colors.dart';

class EmpBottomNavbar extends StatefulWidget {
  const EmpBottomNavbar({super.key});

  @override
  State<EmpBottomNavbar> createState() => _EmpBottomNavbarState();
}

class _EmpBottomNavbarState extends State<EmpBottomNavbar> {
  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  // Define the screens for each tab
  List<Widget> _buildScreens() {
    return [
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => EmpDashboardScreen(), // Replace with your screen
          );
        },
      ),
      Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => RequestsScreen(), // Replace with your screen
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
            builder: (context) => EmpMyProfile(), // Replace with your screen
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
        title: "Requests",
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

import 'package:get/get.dart';
import 'package:isit_app/common/screens/notifications/notifications_screen.dart';
import 'package:isit_app/common/screens/settings/support_screen.dart';
import 'package:isit_app/modules/corporate/presentation/screens/companyEmpDtl/company_add_employees.dart';
import 'package:isit_app/modules/corporate/presentation/screens/changePassword/company_change_password.dart';
import 'package:isit_app/modules/corporate/presentation/screens/company_my_employees.dart';
import 'package:isit_app/modules/corporate/presentation/screens/companyEmpDtl/edit_company_employee_detail.dart';
import 'package:isit_app/modules/user/presentation/screens/user_dashboard_screen.dart';
import '../../app/auth/signin_screen.dart';
import '../../common/screens/settings/settings_screen.dart';
import '../../modules/corporate/presentation/screens/company_dashboard_screen.dart';
import '../../modules/corporate/presentation/screens/company_document_management.dart';
import '../../modules/corporate/presentation/screens/company_subscription.dart';
import '../../modules/corporate/presentation/screens/document_management_form.dart';
import '../../modules/employee/presentation/screens/emp_dashboard_screen.dart';
import '../../modules/professional/presentation/screnns/pro_dashboard_screen.dart';
import '../splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String appSignIn = '/appSignIn';
  static const String appChangePassword = '/appChangePassword';

  // Corporate Routes
  static const String companyDashboardScreen = '/companyDashboardScreen';
  static const String myEmployeesScreen = '/myEmployeesScreen';
  static const String documentManagementScreen = '/documentManagementScreen';
  static const String reportManagementScreen = '/reportManagementScreen';
  static const String subscriptionScreen = '/subscriptionScreen';
  static const String companyAddEmployeeScreen = '/companyAddEmployeeScreen';
  static const String editCompanyEmployeeDetail = '/editCompanyEmployeeDetail';
  static const String addServiceCompanyEmp = '/addServiceCompanyEmp';
  static const String documentManagementFormScreen =
      '/documentManagementFormScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String chatListScreen = '/chatListScreen';
  static const String myServicesScreen = '/myServicesScreen';
  static const String myProfileFormScreen = '/myProfileFormScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String editProfileProDetailScreen =
      '/editProfileProDetailScreen';
  static const String editProfilePastDetailScreen =
      '/editProfilePastDetailScreen';
  static const String blockScreen = '/blockScreen';
  static const String supportScreen = '/supportScreen';
  static const String workDayTimeScreen = '/workDayTimeScreen';

  //Employee
  static const String empDashboardScreen = '/empDashboardScreen';

  // Professional Routes
  static const String proForgetPasswordScreen = '/proForgetPasswordScreen';
  static const String proCreateNewPasswordScreen =
      '/proCreateNewPasswordScreen';
  static const String proPasswordChangedSuccessScreen =
      '/proPasswordChangedSuccessScreen';
  static const String proDashboardScreen = '/proDashboardScreen';
  static const String proMyProfileFormScreen = '/proMyProfileFormScreen';
  static const String proChatListScreen = '/proChatListScreen';
  static const String proChatMessagesScreen = '/proChatMessagesScreen';
  static const String proBlockScreen = '/proBlockScreen';
  static const String proSettingsScreen = '/proSettingsScreen';
  static const String proSupportScreen = '/proSupportScreen';
  static const String myServicesProScreen = '/myServicesProScreen';
  static const String changePasswordProScreen = '/changePasswordProScreen';
  static const String proNotificationsScreen = '/proNotificationsScreen';
  static const String proSubscriptionScreen = '/proSubscriptionScreen';

  static const String proEditProfileScreen = '/proEditProfileScreen';
  static const String proEditProfileProDetailScreen =
      '/proEditProfileProDetailScreen';
  static const String proEditProfilePastDetailScreen =
      '/proEditProfilePastDetailScreen';
  static const String proWorkDayTimeScreen = '/proWorkDayTimeScreen';
  static const String proRatingAndReviewScreen = '/proRatingAndReviewScreen';

  //users routes
  static const String userMyServicesScreen = '/userMyServicesScreen';
  static const String userDashboardScreen = '/userDashboardScreen';
  static const String userMyProfileFormScreen = '/userMyProfileFormScreen';
  static const String userEditProfileScreen = '/userEditProfileScreen';
  static const String userEditProfileProDetailScreen =
      '/userEditProfileProDetailScreen';
  static const String userWorkDayTimeScreen = '/userWorkDayTimeScreen';
  static const String userEditProfilePastDetailscreen =
      '/userEditProfilePastDetailscreen';
  static const String userChatMessagesScreen = '/userChatMessagesScreen';
  static const String userRatingAndReviewScreen = '/userRatingAndReviewScreen';
  static const String userNotificationsScreen = '/userNotificationsScreen';
  static const String userSupportScreen = '/userSupportScreen';
  static const String userBlockScreen = '/userBlockScreen';
  static const String userDashboardMapScreen = '/userDashboardMapScreen';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(
      name: appSignIn,
      page: () => AppSignInScreen(),
      transition: Transition.circularReveal,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(name: companyDashboardScreen, page: () => CompanyDashboardScreen()),
    GetPage(name: myEmployeesScreen, page: () => CompanyMyEmployeesScreen()),
    GetPage(
        name: documentManagementScreen, page: () => CompanyDocumentManagement()),
  // GetPage(name: reportManagementScreen, page: () => CompanyReportManagement()),
   GetPage(name: subscriptionScreen, page: () => CompanySubscriptionScreen()),
   GetPage(name: supportScreen, page: () => SupportScreen()),
    GetPage(name: companyAddEmployeeScreen, page: () => CompanyAddEmployees()),
    GetPage(name: editCompanyEmployeeDetail, page: () => EditCompanyEmployeeDetail()),
    GetPage(
        name: documentManagementFormScreen,
        page: () => DocumentManagementFormScreen()),
    GetPage(
        name: appChangePassword, page: () => AppChangePassword()),
    GetPage(name: settingsScreen, page: () => SettingsScreen()),
    GetPage(name: notificationScreen, page: () => NotificationsScreen()),

    // GetPage(name: myServicesScreen, page: () => MyServicesScreen()),
    // GetPage(name: myProfileFormScreen, page: () => MyProfileFormScreen()),
    // GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    //
    // GetPage(
    //     name: editProfileProDetailScreen,
    //     page: () => EditProfileProDetailScreen()),
    // GetPage(
    //     name: editProfilePastDetailScreen,
    //     page: () => EditProfilePastDetailscreen()),
    // GetPage(name: workDayTimeScreen, page: () => WorkDaystimeScreen()),
    // GetPage(name: chatMessages, page: () => ChatMessagesScreen()),
    // GetPage(name: blockScreen, page: () => BlockScreen()),
    GetPage(name: empDashboardScreen, page: () => EmpDashboardScreen()),
     GetPage(name: proDashboardScreen, page: () => ProDashboardScreen()),
    // GetPage(name: proMyProfileFormScreen, page: () => ProMyProfileFormScreen()),
    // GetPage(name: proChatListScreen, page: () => ProChatListScreen()),
    // GetPage(name: proChatMessagesScreen, page: () => ProChatMessagesScreen()),
    // GetPage(name: proBlockScreen, page: () => ProBlockScreen()),
    // GetPage(name: proSettingsScreen, page: () => ProSettingsScreen()),
    // GetPage(name: proSupportScreen, page: () => ProSupportScreen()),
    // GetPage(name: myServicesProScreen, page: () => MyServicesProScreen()),
    // GetPage(name: proNotificationsScreen, page: () => ProNotificationsScreen()),
    // GetPage(name: proSubscriptionScreen, page: () => ProSubscriptionScreen()),
    // GetPage(name: proEditProfileScreen, page: () => ProEditProfileScreen()),
    // GetPage(
    //     name: proEditProfileProDetailScreen,
    //     page: () => ProEditProfileProDetailScreen()),
    // GetPage(
    //     name: proEditProfilePastDetailScreen,
    //     page: () => ProEditProfilePastDetailscreen()),
    // GetPage(name: proWorkDayTimeScreen, page: () => ProWorkDaystimeScreen()),
    // GetPage(
    //     name: proRatingAndReviewScreen, page: () => ProRatingAndReviewScreen()),
    // GetPage(name: userMyServicesScreen, page: () => UserMyServicesScreen()),
    GetPage(name: userDashboardScreen, page: () => UserDashboardScreen()),
    // GetPage(
    //     name: userMyProfileFormScreen, page: () => UserMyProfileFormScreen()),
    // GetPage(name: userEditProfileScreen, page: () => UserEditProfileScreen()),
    // GetPage(
    //     name: userEditProfileProDetailScreen,
    //     page: () => UserEditProfileProDetailScreen()),
    // GetPage(name: userWorkDayTimeScreen, page: () => UserWorkDaystimeScreen()),
    // GetPage(
    //     name: userEditProfilePastDetailscreen,
    //     page: () => UserEditProfilePastDetailscreen()),
    // GetPage(name: userChatListScreen, page: () => UserChatListScreen()),
    // GetPage(name: userChatMessagesScreen, page: () => UserChatMessagesScreen()),
    // GetPage(name: userSettingsScreen, page: () => UserSettingsScreen()),
    // GetPage(
    //     name: userRatingAndReviewScreen,
    //     page: () => UserRatingAndReviewScreen()),
    // GetPage(
    //     name: userNotificationsScreen, page: () => UserNotificationsScreen()),
    // GetPage(name: userSupportScreen, page: () => UserSupportScreen()),
    // GetPage(name: userBlockScreen, page: () => UserBlockScreen()),
    // GetPage(name: userDashboardMapScreen, page: () => UserDashboardMapScreen()),
  ];
}

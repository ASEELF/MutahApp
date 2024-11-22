
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/academic_plan/academic_plan.dart';
import 'package:mutahapplication/presentation/announcements/announcement.dart';
import 'package:mutahapplication/presentation/forgot_password/forgot_password.dart';
import 'package:mutahapplication/presentation/hours_fees/hours_fees.dart';
import 'package:mutahapplication/presentation/increase_academic_load/increase_academic_load.dart';
import 'package:mutahapplication/presentation/login/login.dart';
import 'package:mutahapplication/presentation/main/main_view.dart';
import 'package:mutahapplication/presentation/marks/marks.dart';
import 'package:mutahapplication/presentation/my_requests/my_resuests.dart';
import 'package:mutahapplication/presentation/postponing_studies/posponing_studies_request.dart';
import 'package:mutahapplication/presentation/profile/profile.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/schedule/schedule.dart';
import 'package:mutahapplication/presentation/splash/splash.dart';
import 'package:mutahapplication/presentation/substitute_Request/substitute_request.dart';
import 'package:mutahapplication/presentation/synchronization_request/synchronization_Request.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String profileRoute= "/profile";
  static const String announcementsRoute= "/announcement";
  static const String myRequestsRoute= "/myRequests";
  static const String schedule= "/schedule";
  static const String academicPlan= "/academicPlan";
  static const String hoursFees= "/hoursFees";
  static const String marks= "/marks";
  static const String substituteCourseRequest= "/substituteCourseRequest";
  static const String increasingAcademicLoadRequest= "/increasingAcademicLoadRequest";
  static const String postponingStudiesRequest= "/postponingStudiesRequest";
  static const String synchronizationCoursesRequest= "/synchronizationCoursesRequest";


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>   SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginView());
      case Routes.forgotPasswordRoute:
         return MaterialPageRoute(builder: (_) =>   ForgotPasswordView());
       case Routes.mainRoute:
         return MaterialPageRoute(builder: (_) =>  MainView());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) =>  ProfilePage());
      case Routes.announcementsRoute:
        return MaterialPageRoute(builder: (_) =>  AnnouncementsPage());
      case Routes.myRequestsRoute:
        return MaterialPageRoute(builder: (_) =>  MyRequestsPage());
      case Routes.schedule:
        return MaterialPageRoute(builder: (_) =>  SchedulePage());
      case Routes.academicPlan:
        return MaterialPageRoute(builder: (_) =>  AcademicPlanPage());
      case Routes.hoursFees:
        return MaterialPageRoute(builder: (_) =>  HoursFeesPage());
      case Routes.marks:
        return MaterialPageRoute(builder: (_) =>  MarksPage());
      case Routes.substituteCourseRequest:
        return MaterialPageRoute(builder: (_) =>  SubstitueRequestPage());
      case Routes.increasingAcademicLoadRequest:
        return MaterialPageRoute(builder: (_) =>  IncreaseAcademicLoadRequestPage());
      case Routes.postponingStudiesRequest:
        return MaterialPageRoute(builder: (_) =>  PosponingStudiesRequestPage());
      case Routes.synchronizationCoursesRequest:
        return MaterialPageRoute(builder: (_) =>  SynchronizationRequestPage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title:  Text(AppStrings.noRouteFound),
          ),
          body: Center(child:  Text(AppStrings.noRouteFound)),
        ));
  }
}
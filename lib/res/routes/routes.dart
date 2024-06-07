import 'package:get/get.dart';
import '../../view/student_dashboard/addinterest_view.dart';
import '../../view/student_dashboard/aiagent.dart';
import '../../view/student_dashboard/coursefind_view.dart';
import '../../view/student_dashboard/docupload_view.dart';
import '../../view/student_dashboard/formreq_view.dart';
import '../../view/student_dashboard/newservices_view.dart';
import '../../view/student_dashboard/simrequest_view.dart';
import '../../view/login/welcome.dart';
import '../../view/layout_view.dart';
import '../../view/student_dashboard/upcomming_view.dart';
import '/res/routes/routes_name.dart';
import '/view/login/login_view.dart';
import '/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.welcomeView,
          page: () => const WelcomeScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),

        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
       
        //admin route
        GetPage(
          name: RouteName.layoutView,
          page: () => const AdminLayout(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
         GetPage(
          name: RouteName.docUpload,
          page: () => const DocUpload(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
         GetPage(
          name: RouteName.simReq,
          page: () => const SimReq(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
         GetPage(
          name: RouteName.coursefind,
          page: () =>  const Coursefind(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.addinterest,
          page: () =>  const Addinterest(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.formReq,
          page: () =>  const FormReq(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.aiAgent,
          page: () =>  const AiAgent(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.newservices,
          page: () =>  const Newservices(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.upcomming,
          page: () =>  const Upcomming(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}

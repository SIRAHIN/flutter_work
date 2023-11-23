import 'package:ecom/models/productsModel.dart';
import 'package:ecom/pages/Main_Page/ui/fragments/paymentDonePage.dart';
import 'package:ecom/pages/details_Page/ui/details_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:ecom/pages/splashscreen/ui/splash_screen.dart';

import 'package:ecom/router/middlewares/auth_middleware.dart';
import 'package:go_router/go_router.dart';

import '../pages/Main_Page/ui/main_page.dart';


class RouteManager {
  static final routeConfig = GoRouter(routes: [

    GoRoute(
      path: RoutesName.splashScreen,
      name: RoutesName.splashScreen,
      builder: (context, state) => SplashScreen(),
      
      ),


    //Home Page Route
    GoRoute(
      name: RoutesName.MainPage,
      path: RoutesName.MainPage,
      builder: (context, state) => MainPage(),
      redirect: (context, state) => AuthMiddleWare.guardWithLogin(),
      routes: [
        GoRoute(
          path: RoutesName.DetailsPage,
          name: RoutesName.DetailsPage,
          builder: (context, state) => DetailsPage(products: state.extra as ProductsModel),
          )
      ]
    ),

     GoRoute(
              path: RoutesName.paymentDonePage,
              name: RoutesName.paymentDonePage,
              builder: (context, state) => PaymentDonePage(),
              ),

    //Login Page Route
    GoRoute(
      name: RoutesName.loginPage,
      path: RoutesName.loginPage,
      builder: (context, state) => LoginPage(),
    ),
   
  ]);
}

abstract class RoutesName {
  static String splashScreen = '/';
   static String MainPage = '/mainpage';
   static String loginPage = '/loginPage';
   static String DetailsPage = 'detailsPage';
  static String paymentDonePage = '/paymentDonePage';
 
}
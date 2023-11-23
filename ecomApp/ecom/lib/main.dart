
import 'package:ecom/providers/auth_provider.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'router/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder:(context, child) =>  MultiProvider  (
        providers: [
          ChangeNotifierProvider <AuthProvider> (create: (context) => AuthProvider(),),
          ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider(),)
        ],
        builder: (context, child) =>  MaterialApp.router(
          routerConfig: RouteManager.routeConfig,
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          
        ),
      ),
    );
  }
}
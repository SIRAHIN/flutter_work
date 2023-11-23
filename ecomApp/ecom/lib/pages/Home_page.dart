import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/datasource/sharedprefernce_datasource.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constaints/sharedPreferences_tokenKey.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("HomePage"),
            ElevatedButton(onPressed: () async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              
              SharedPreferencesDataSource sharedPreferencesDataSource = SharedPreferencesDataSource(sharedPreferences);
              
              sharedPreferencesDataSource.deleteToken();

              context.goNamed(RoutesName.loginPage);
            }, child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/pages/Main_Page/ui/main_page.dart';
import 'package:ecom/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.deepPurple.shade400,
      body: Container(
        width: double.infinity,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(CustomesIcons.splashLogo, width: 300),


            SizedBox(height: 30,),


            SpinKitSpinningLines(
              color: Colors.pinkAccent.shade400,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}

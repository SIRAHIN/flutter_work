import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/providers/auth_provider.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/widgets/appbarwidget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(titleText: 'Hello, Welcome', BodyText: 'Lets Login or Signup'),
              _LoginBgLogo(),
              LgoinSignupFormSection(),
            ],
          ),
        ),
      ),
    );
  }
}

//  --AppBar Component--


// -- Login Bg Logo -- //
class _LoginBgLogo extends StatelessWidget {
  const _LoginBgLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Center(
        child: Image.asset(
          'assets/graphics/common/login_page_bg_logo.png',
          width: 200.w,
        ),
      ),
    );
  }
}

// -- LgoinSignupFormSection -- //
class LgoinSignupFormSection extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController _userNameEditionController = TextEditingController();
  TextEditingController _password1EditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //Email input field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: TextFormField(
              controller: _userNameEditionController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle:
                      TextStyle(fontFamily: 'EncodeSans', fontSize: 20.sp)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter valid User Name';
                }
              },
            ),
          ),

          //Passwor input field
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
            child: TextFormField(
              controller: _password1EditingController,
              textAlign: TextAlign.center,
              obscureText: true,
              //keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle:
                      TextStyle(fontFamily: 'EncodeSans', fontSize: 20.sp)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter valid Password';
                }
              },
            ),
          ),

          Consumer<AuthProvider>(
            builder: (context, authValue, child) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30),
                    child: authValue.hasError
                        ? Text('${authValue.ErrorMsg}',
                            style: TextStyle(color: Colors.red))
                        : Container())
              ],
            ),
          ),

          SizedBox(
            height: 30.h,
          ),

          GestureDetector(
            onTap: () async {
            bool isTokenSave =  await Provider.of<AuthProvider>(context, listen: false).login(
                formKey,
                _userNameEditionController.text,
                _password1EditingController.text,
              );
              if(isTokenSave){
                context.goNamed(RoutesName.MainPage);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Container(
                child: Center(
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, child) =>
                        authProvider.isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'EncodeSans',
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                  ),
                ),
                height: 56.h,
                width: 335.w,
                color: CColors.loginBtnColor,
              ),
            ),
          ),

          SizedBox(
            height: 10.h,
          ),

          GestureDetector(
            onTap: ()  {
              //signup page will go to route_manager.dart class for homePage Route then we can see there is a perameter
              //called redirect which indicated to auth_middleware.dart's function called guardWithLogin(){}
              //which check the token value if it's null it will reture to --> loginPage Instaed of --> homePage.
              context.goNamed(RoutesName.MainPage);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Container(
                child: Center(
                  child: Text(
                          'Signup',
                          style: TextStyle(
                              fontFamily: 'EncodeSans',
                              fontSize: 14.sp,
                              color: Colors.white),
                        ),
                ),
                height: 56.h,
                width: 335.w,
                color: CColors.signUpBtnColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

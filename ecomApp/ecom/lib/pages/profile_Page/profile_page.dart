import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/graphics/common/profile.png'),
                    backgroundColor: CColors.loginBtnColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Shehanul Islam Rahin',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'EncodeSans',
                        color: CColors.loginBtnColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('01618815928'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Divider(
                      color: Colors.deepPurple,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
        
               SizedBox(height: 15,),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account',style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'EncodeSans',
                        color: CColors.loginBtnColor)),
                    profileCard(
                      icon: Icon(Icons.face),
                      text: 'My Profile',
                    ),
                    profileCard(
                      icon: Icon(Icons.lock_outline),
                      text: 'Reset Password',
                    ),
        
                    SizedBox(height: 20,),
        
                    Text('Others',
                     style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'EncodeSans',
                        color: CColors.loginBtnColor),
                    ),
                    profileCard(
                        text: 'About Us', icon: Icon(Icons.info_outline_rounded)),
                    profileCard(
                        text: 'Submit your problem',
                        icon: Icon(Icons.bug_report_outlined)),
                    profileCard(
                        text: 'Feedback', icon: Icon(Icons.feedback_outlined)),
                    profileCard(text: 'Share App', icon: Icon(Icons.share_outlined)),
                    profileCard(
                        text: 'Privacy Policy ',
                        icon: Icon(Icons.privacy_tip_outlined)),
                    profileCard(text: 'Logout', icon: Icon(Icons.logout_outlined), onTap: () => context.goNamed(RoutesName.loginPage),),
                  ],
                ),
              )
            ],
          ),
        ),
      
        floatingActionButton: SizedBox(
          width: 50,
          child: FloatingActionButton(
            backgroundColor: Colors.deepPurple.shade400,
            child: Image.asset(CustomesIcons.backArrow, width: 30,),
            onPressed: () {
              //context.goNamed(RoutesName.MainPage);
              Navigator.pop(context);
            },
            ),
        ),
      ),
    );
  }
}

class profileCard extends StatelessWidget {
  String text;
  Icon icon;
  VoidCallback? onTap;
  profileCard({super.key, required this.text, required this.icon,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
      //    margin: EdgeInsets.symmetric(vertical:10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'EncodeSans',
                      color: CColors.loginBtnColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

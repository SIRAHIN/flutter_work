import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/pages/Main_Page/ui/fragments/paymentDonePage.dart';

import 'package:ecom/pages/main_page/ui/providers/main_page_navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'fragments/cart_fragment.dart';
import 'fragments/home_fragment.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainPageNavbarProvider(),
      builder: (context, child) => Scaffold(
        body:
            Consumer<MainPageNavbarProvider>(builder: (context, value, child) {
          if (value.getIndex() == 0) {
            return HomeFragment();
          }
          if (value.getIndex() == 1) {
            return CartFragment();
          }
          if (value.getIndex() == 2) {
            return PaymentDonePage();
          }
          return Container();
        }),
        bottomNavigationBar: Consumer<MainPageNavbarProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: CColors.loginBtnColor),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Container(
                  child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      onTap: (index) => value.setIndex(index),
                      currentIndex: value.getIndex(),
                      items: [
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              CustomesIcons.HomeIconPath,
                              width: 35.w,
                            ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Image.asset(
                              CustomesIcons.CartIconPath,
                              width: 35.w,
                            ),
                            label: 'Cart'),
                        // BottomNavigationBarItem(
                        //     icon: Image.asset(
                        //       CustomesIcons.FavouriteIconPath,
                        //       width: 35.w,
                        //     ),
                        //     label: 'Favorite'),
                      ]
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

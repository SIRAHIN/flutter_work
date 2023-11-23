
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/core/widgets/circleIcons.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class PaymentDonePage extends StatelessWidget {
  const PaymentDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

               const Text('Congratulations Payment Done', style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontFamily: 'EncodeSans'
               ),),

              SizedBox(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  child: Image.asset(CustomesIcons.paymentdone))),

                  

             

              SizedBox(
                height: 20,
              ),

              Consumer<CartProvider>(
                builder: (context, value, child) => InkWell(
                  onTap: () {
                    context.goNamed(RoutesName.MainPage);
                    value.setdefaultvalue();
                  }, 
                  child: CircleIcons(
                    ImgUrl: CustomesIcons.backArrow,
                    
                    ),
                ),
              ),
            ],
          ),
        ),
    )
    );
  }
}
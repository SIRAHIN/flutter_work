import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/core/widgets/circleIcons.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartFragment extends StatelessWidget {
   CartFragment({super.key});

  TextEditingController carNumberEditiongController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          _Header(),
          CartList_(),
          CartTotalSubTotalText( controller :carNumberEditiongController),
          PayButton_(
           controller : carNumberEditiongController
          ),
        ],
      ),
    );
  }
}





class PayButton_ extends StatelessWidget {

  TextEditingController  controller; 

   PayButton_({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          color: CColors.loginBtnColor,
        ),
        height: 55,
        margin: EdgeInsets.only(left: 60, right: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              CustomesIcons.shoppingCart,
              width: 24.h,
            ),
            SizedBox(
              width: 10.w,
            ),
            InkWell(
              onTap: () {
            
              bool PaymentCondition =  Provider.of<CartProvider>(context, listen: false).payNow(controller.text);
              
              
              if(PaymentCondition == true){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment Done!')));
                context.goNamed(RoutesName.paymentDonePage);
              }
              else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment Unsuccessful!')));
              }

              },
              child: Text(
                'Pay Now',
                style: TextStyle(
                    fontFamily: 'EncodeSans',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartTotalSubTotalText extends StatelessWidget {
  TextEditingController controller;
   CartTotalSubTotalText({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(15.0),
        height: 348.h,
        width: 375.w,
        //color: Colors.deepPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Information',
              style: TextStyle(
                  fontFamily: 'EncodeSans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 35.h,
                width: 287.w,
                child: TextField(
                  controller: controller,
                  cursorHeight: 20.h,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: CColors.loginBtnColor,
                  decoration: InputDecoration(
                      // fillColor: CColors.inputHintTextColor,
                      suffixIcon: Image.asset(
                        CustomesIcons.downArrow,
                      ),
                      hintText: '**** **** **** 2143',
                      hintStyle: TextStyle(fontSize: 14.sp),
                      prefixIcon: Image.asset(
                        CustomesIcons.visa,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r))),
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total (${cartProvider.totalItems} items)',
                          style: TextStyle(
                              fontFamily: 'EncodeSans',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          (cartProvider.totalPrice.toString().length < 6)
                              ? '\$${cartProvider.totalPrice}'
                              : '\$${cartProvider.totalPrice.toString().substring(0, 6)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Fee',
                          style: TextStyle(
                              fontFamily: 'EncodeSans',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          '\$10.0',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              fontFamily: 'EncodeSans',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (cartProvider.totalPrice.toString().length < 6)
                              ? '\$${cartProvider.totalPrice + 10}'
                              : '\$${(cartProvider.totalPrice + 10).toString().substring(0, 6)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartList_ extends StatelessWidget {
  const CartList_({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<CartProvider>(
        builder: (context, cartProvider, child) => ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartProvider.items.length,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      //color: Colors.deepPurple,
                      border: Border(bottom: BorderSide(color: Colors.black))),
                  margin: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  height: 70,
                  width: 327,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    cartProvider.items[index].products.image ??
                                        'https://picsum.photos/200/300',
                                  ))),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: 135.w,
                          //color: Colors.orange,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    (cartProvider.items[index].products.title!
                                                .length <
                                            25)
                                        ? '${cartProvider.items[index].products.title}'
                                        : '${cartProvider.items[index].products.title!.substring(0, 20)}...',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'EncodeSans',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    cartProvider
                                            .items[index].products.category ??
                                        'Dress modern',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'EncodeSans',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Text(
                                '${cartProvider.items[index].products.price}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'EncodeSans',
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 135.w,
                          //color: Colors.pink,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                CustomesIcons.menu,
                                height: 4.h,
                                width: 16.w,
                              ),
                              SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: CColors.loginBtnColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.r),
                                                bottomLeft:
                                                    Radius.circular(8.r))),
                                        height: 30,
                                        child: IconButton(
                                            iconSize: 15,
                                            color: Colors.white,
                                            onPressed: () {
                                              cartProvider.removeProduct(
                                                  cartProvider
                                                      .items[index].products);
                                            },
                                            icon: Icon(Icons.remove)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        color: CColors.loginBtnColor,
                                        child: Text(
                                          '${cartProvider.items[index].quantity}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: CColors.loginBtnColor,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(8.r),
                                                bottomRight:
                                                    Radius.circular(8.r))),
                                        height: 30,
                                        child: IconButton(
                                            iconSize: 15,
                                            color: Colors.white,
                                            onPressed: () {
                                              cartProvider.addProducts(
                                                  cartProvider
                                                      .items[index].products);
                                            },
                                            icon: Icon(Icons.add)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      sliver: SliverAppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: CircleIcons(ImgUrl: CustomesIcons.backArrow),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'EncodeSans',
                    color: CColors.loginBtnColor),
              ))
        ],
      ),
    );
  }
}

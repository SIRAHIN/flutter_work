import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/core/constaints/customsIcons.dart';
import 'package:ecom/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/circleIcons.dart';
import '../../../models/productsModel.dart';

class DetailsPage extends StatelessWidget {
  final ProductsModel products;
   DetailsPage({super.key , required this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 22.h),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                headerSection(imgUrl: products.image),
                BodySection(title : products.title, details : products.description, products : products)
              ],
            ),
          ),
        ),
        
        floatingActionButton: footerSection(
          //price : products.price,
          products: products,
        ),
      ),
    );
  }
}




///////////______________////////////////////
class headerSection extends StatelessWidget {
  final String? imgUrl;
  const headerSection({
    super.key,
    required this.imgUrl
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
          child: Container(
            height: 392.h,
            width: 327.w,
            child: Image.network(
              imgUrl!,
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  return context.pop();
                },
                child: CircleIcons(
                  ImgUrl: CustomesIcons.backArrow,
                ),
              ),
              CircleIcons(ImgUrl: CustomesIcons.heart)
            ],
          ),
        )
      ],
    );
  }
}




///////////______________////////////////////
class BodySection extends StatelessWidget {
  final String? title;
  final String? details;
  ProductsModel products;
  
   BodySection({
    super.key,
    required this.title,
     required this.details,
     required this.products
     
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 500,
          width: 375.w,
          //color: Colors.amber,
          child: Column(
            children: [
              body_Title_Button(title: title!, products: products),
              BodyTextSection(details : details!),
            ],
          ),
        ),
      ),
    );
  }
}

class body_Title_Button extends StatelessWidget {
  final String title;
  ProductsModel products;
   body_Title_Button({
    super.key,
    required this.title,
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
             title,
              style: TextStyle(fontSize: 24.sp, fontFamily: 'EncodeSans'),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).removeProduct(products);
                      },
                      icon: Icon(
                        Icons.remove,
                        color: CColors.loginBtnColor,
                      )),
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                Consumer<CartProvider>(
                  builder: (context, cartProvider, child) => 
                  Text(
                      '${cartProvider.countProduct(products).toString()}',
                    style: TextStyle(fontSize: 20.sp, fontFamily: 'EncodeSans'),
                  ),
                ),
                SizedBox(
                  width: 10.0.w,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).addProducts(products);
                      },
                      icon: Icon(
                        Icons.add,
                        color: CColors.loginBtnColor,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BodyTextSection extends StatelessWidget {
  final String details;
  const BodyTextSection({
    super.key,
    required this.details
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Text(
        details,
        style: TextStyle(fontSize: 16.sp, fontFamily: 'EncodeSans'),
      ),
    );
  }
}


///////////______________////////////////////
class footerSection extends StatelessWidget {
  //final double? price;
  ProductsModel products;
   footerSection({
    super.key,
    //required this.price,
    required this.products
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(40.r),
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(CustomesIcons.shoppingCart,
                width:24.h ,
                ),

                SizedBox(width: 10.w,),

                Row(
                 crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Added')));
                        Provider.of<CartProvider>(context, listen: false).addProducts(products);
                      },
                      child: Text(
                        'Add to Cart | \$${products.price}',
                        style: TextStyle(
                            fontFamily: 'EncodeSans',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),

                    SizedBox(width: 4.0.w,),

                    Text(
                      '\$190.99',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontFamily: 'EncodeSans',
                          fontSize: 11.sp,
                          color: Colors.white),
                    ),
                  ],
                ),

              ],
            ),
          ),
          height: 56.h,
          width: 335.w,
          color: CColors.loginBtnColor,
        ),
      );
  }
}
import 'package:ecom/core/constaints/c_colors.dart';
import 'package:ecom/models/productsModel.dart';
import 'package:ecom/pages/profile_Page/profile_page.dart';
import 'package:ecom/router/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/appbarwidget.dart';
import '../providers/home_fragment_provider.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeFragmentProvider(),
      builder: (context, child) =>  SafeArea(
        child: CustomScrollView(
          slivers:  [
            HomeFragAppBar(),
            HomeFragSearchBox(),
            CategorisTab(),
            ProductCart()
          ],
        ),
      ),
    );
  }
}

///// ----------------------------- /////
class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeFragmentProvider>(
        builder: (context, value, child) {
        List<ProductsModel> porducts = value.products;
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Visibility(
            visible: value.visibilityForProducts,
           replacement: Center(child: CircularProgressIndicator(
            color: CColors.loginBtnColor,
            backgroundColor: Colors.pink,
           ),
           ),
            child:  GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3 / 7),
              itemCount: value.products.length,
              
              itemBuilder: (context, index) { 

              return ProductCartDesign(

                  onTap : (){
                    context.goNamed(RoutesName.DetailsPage,
                    extra: porducts[index],
                    );

                    print(porducts[index]);
                  },

                  title: (porducts[index].title!.length > 20 ? '${porducts[index].title!.substring(0,20)} ...' : '${porducts[index].title!}'),
                  category: "${porducts[index].category}",
                  price: '\$${porducts[index].price}',
                  rating: '${porducts[index].rating!.rate}',
                  image: '${value.products[index].image}');
              }
            ),
          ),
        );
        }
      ),
    );
  }
}

class ProductCartDesign extends StatelessWidget {
  String title;
  String category;
  String price;
  String rating;
  String image;
  VoidCallback onTap;

  ProductCartDesign({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        //color: Colors.red,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14.0.r),
                child: Container(
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                          backgroundColor: CColors.loginBtnColor,
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: Colors.white,
                          ))),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        image,
                      ),
                    ),
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 5, left: 5),
                width: double.infinity,
                //color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'EncodeSans',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(category),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFFD33C),
                              ),
                              Text(
                                rating,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
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

///// ----------------------------- /////
class CategorisTab extends StatelessWidget {
  const CategorisTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Container(
          height: 40.h,
          child: Consumer<HomeFragmentProvider>(
            builder: (context, value, child) => Visibility(
              visible: value.visibilityForCategories,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.categories.length,
                itemBuilder: (context, index) => 
                InkWell(
                  onTap: () {
                    value.getCategoriesIndex(index);
                  },
                  child: CategoryTabDesign(
                    categorisTitle: value.categories[index],
                    isSelected: index == value.selectedCategoriesIndex,
                  ),
                ),
              ),
              replacement: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryTabDesign extends StatelessWidget {
  String categorisTitle;
  bool isSelected;

  CategoryTabDesign({super.key, required this.categorisTitle , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6,0,6,0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0.r),
        child: Container(
          padding: EdgeInsets.all(12.0),
          color: isSelected ? CColors.loginBtnColor : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/graphics/icons/category.png',
                color: isSelected ? Colors.white : CColors.loginBtnColor,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                categorisTitle.toUpperCase(),
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'EncodeSans',
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : CColors.loginBtnColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///// ----------------------------- /////
class HomeFragSearchBox extends StatelessWidget {
  const HomeFragSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search clothes. . .',
            hintStyle: TextStyle(
                fontFamily: 'EncodeSans',
                fontSize: 15.h,
                color: CColors.inputHintTextColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/graphics/icons/search.png',
                width: 20.w,
                height: 20.h,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 3,
                  color: CColors.inputBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}

///////////////////
class HomeFragAppBar extends StatelessWidget {
  const HomeFragAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarWidget(
                titleText: 'Hello, Welcome',
                BodyText: 'Albert Stevano',
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),)),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/graphics/common/profile.png'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

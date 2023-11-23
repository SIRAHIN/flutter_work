import 'dart:convert';

import 'package:ecom/models/productsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeFragmentProvider with ChangeNotifier{

  List<ProductsModel> products = [];

  List categories = ['All categories'];

  int selectedCategoriesIndex = 0;

  bool visibilityForCategories = false;

  bool visibilityForProducts = false;

  HomeFragmentProvider(){
    FeatchAllProduct();
    FeactchAllCategories();
  }

   Future  FeatchAllProduct () async {
    visibilityForProducts = false;
    //TODO featch all product from server
   http.Response res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
   
   if(res.statusCode == 200){
      products.clear();
      List JsonDecodeData = jsonDecode(res.body);
      JsonDecodeData.forEach((element) {
      products.add(ProductsModel.fromJson(element));
    });
   visibilityForProducts = true;
   notifyListeners(); 
   }
 
   return products;
  }


                                      //List of categories//

   FeactchAllCategories() async {
    // TODO fetch categories and subcategories
    http.Response res = await http.get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if(res.statusCode == 200){
      //here res.body is list type so when we asign list of string into another list we need to use add.ALL
      categories.addAll(jsonDecode(res.body));
    }

    visibilityForCategories = true;
    notifyListeners();
    //return categories;
    
   }

   Future<void> getCategoriesIndex(int index) async {
    
    this.selectedCategoriesIndex=index;
    
    notifyListeners();
    if(selectedCategoriesIndex == 0){
      await FeatchAllProduct();
    }else{
      await FeatchCategorisByIndex(categories[index]);
    }
   }
  
  Future FeatchCategorisByIndex(String category) async {
    visibilityForProducts = false;
    http.Response res = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    if(res.statusCode == 200){
      products.clear();
      
      List jsonDecodeDate = jsonDecode(res.body);
      jsonDecodeDate.forEach((element) {
       products.add(ProductsModel.fromJson(element));
      });

    visibilityForProducts = true;
    notifyListeners();
    }
   
    //return products;
  }

}
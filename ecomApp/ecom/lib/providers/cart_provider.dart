import 'dart:convert';

import 'package:ecom/models/product_quantity_model.dart';
import 'package:ecom/models/productsModel.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {

  List<ProductQuantityModel> items = [];

  double totalPrice = 0;
  int totalItems = 0;
  int shippingfee = 0;
  

  // List<ProductQuantityModel> get items {
  //   return _items;
  // }

  addProducts(ProductsModel products){
    for(var item in items){
      if(item.products.id == products.id){
        item.quantity +=1;
       // print(items.length);
        notifyListeners();
        calculateTotalPriceAndItem();
        return;
      }
    }
     items.add(ProductQuantityModel(products: products, quantity: 1));
     notifyListeners();
     calculateTotalPriceAndItem();
  }


  removeProduct(ProductsModel products){
    for(var item in items){
      if(item.products.id == products.id){
        item.quantity -= 1;
        notifyListeners();
        calculateTotalPriceAndItem();
        if(item.quantity == 0){
          items.remove(item);
          notifyListeners();
          calculateTotalPriceAndItem();
        }
      }        
    }
    }

    calculateTotalPriceAndItem(){
      totalPrice = 0;
      totalItems = 0;
      for(var item in items){
        totalPrice = (item.products.price!) * item.quantity;
        totalItems = item.quantity;
      }
      notifyListeners();
    }

    int countProduct (ProductsModel porducts){
      for(var item in items){
        if(item.products.id == porducts.id){
          return item.quantity;
        }
      }

      return 0;
    }


  bool payNow (String cardNumber){
    Map response = jsonDecode(FakePayMent.pay(cardNumber));
    if(response['success'] == true){
      items.clear();
      notifyListeners();
      return true;    
    }else{
      return false;
    }
  }

  setdefaultvalue(){
    totalPrice = 0;
    totalItems = 0;
    notifyListeners();
  }

}


class FakePayMent{

static  String pay(String cardNumber){
    if(cardNumber == '1111'){
      return 
        '''{
            "success" : true
           }
        ''';
    }
  
      else{
        return
        ''' {
            "success" : false
            }
        ''';
      }
    }
  }
  

import 'package:ecom/models/productsModel.dart';

class ProductQuantityModel {

  late ProductsModel products;
  late int quantity;

  ProductQuantityModel({required this.products, required this.quantity});

  ProductQuantityModel.fromJson (Map<String, dynamic> json){
    products = ProductsModel.fromJson(json['products']);
    quantity= json['quantity'] as int;
  }


}
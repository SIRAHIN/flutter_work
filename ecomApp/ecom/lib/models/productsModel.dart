import 'ratingModel.dart';

class ProductsModel {
  int? id;
  String? title;
  double? price ;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

   ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? RatingModel.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}


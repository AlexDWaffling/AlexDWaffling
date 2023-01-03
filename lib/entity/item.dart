import 'package:floor/floor.dart';

import 'package:json_annotation/json_annotation.dart';


part 'item.g.dart';

@JsonSerializable()
@entity
class ProductItem {
  @primaryKey
  final int id;

  final String image, name, category, price;

  final int quantity;

  ProductItem(
      this.id,
      this.image,
      this.name,
      this.quantity,
      this.price,
      this.category
  );

  factory ProductItem.fromJson(Map<String, dynamic> json) => _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);

  // ProductItem.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   image = json['image'];
  //   name = json['name'];
  //   price = json['price'];
  //   category = json['category'];
  //   quantity = json['quantity'];
  // //   if (json['data'] != null) {
  // //     data = <BloodDonors>[];
  // //     json['data'].forEach((v) {
  // //       data.add(new BloodDonors.fromJson(v));
  // //     });
  // //   }
  // }
  @override
  String toString() {
    String s = "$id , $name , $price, $quantity, $category, $image";
    return s;
  }
}

import 'package:floor/floor.dart';

@entity
class ProductItem {
  @primaryKey
  late int id;

  late String image, name, category, price;

  late int quantity;

  ProductItem({
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.category
    }
  );
  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    quantity = json['quantity'];
  //   if (json['data'] != null) {
  //     data = <BloodDonors>[];
  //     json['data'].forEach((v) {
  //       data.add(new BloodDonors.fromJson(v));
  //     });
  //   }
  }
}

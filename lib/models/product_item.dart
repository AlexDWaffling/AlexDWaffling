class ProductItemModel {
  late int id;

  late String image, name, category, price;

  late int quantity;

  ProductItemModel({
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.category
    }
  );

  ProductItemModel.fromJson(Map<String, dynamic> json) {
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

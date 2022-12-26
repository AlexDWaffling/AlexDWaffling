class ProductItem {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const PRICE = "price";
  static const CATEGORY = "category";

  int id;
  String image;
  String name;
  int quantity;
  String category;
  double price;

  ProductItem(
      {this.id,
      this.image,
      this.name,
      this.quantity,
      this.price,
      this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'quantity': quantity,
      'price': price,
      'category': category
    };
  }
  // CartItemModel.fromMap(Map<String, dynamic> data){
  //   id = data[ID];
  //   image = data[IMAGE];
  //   name = data[NAME];
  //   quantity = data[QUANTITY];
  //   cost = data[COST].toDouble();
  //   productId = data[PRODUCT_ID];
  //   price = data[PRICE].toDouble();

  // }

  // Map toJson() => {
  //   ID: id,
  //   PRODUCT_ID: productId,
  //   IMAGE: image,
  //   NAME: name,
  //   QUANTITY: quantity,
  //   COST: price * quantity,
  //   PRICE: price
  // };

}

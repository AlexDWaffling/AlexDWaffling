import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/constant_app.dart';
import '../controllers/productController.dart';
import '../entity/item.dart';
import '../widgets/item_list.dart';

class cocktailTab extends StatelessWidget {
  List<ProductItem> cItem = [];
  
  final dynamic getFunc;

  cocktailTab({Key? key, required this.cItem, required this.getFunc}) : super(key: key);
  
  final ProductsController _productsController = Get.put(ProductsController());
  
  @override
  Widget build(BuildContext context) {
    RxList<ProductItem> productsCtg = _productsController.getAllItemsByCategory('Cocktail');
    return Obx(() => GridView.builder(
        itemCount: productsCtg.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: (1 / 1.2)),
        itemBuilder: (context, index) {

          logger.i({"Length": _productsController.products.length});
          logger.i({"Products": _productsController.products[index].toString()});

            return itemList(
                image: productsCtg[index].image,
                title: productsCtg[index].name,
                price: productsCtg[index].price,
                quantity: productsCtg[index].quantity,
                tap: () {
                  // cItem.add(productsCtg[index]);
                  getFunc(productsCtg[index]);
                });
        })
    );
  }
}

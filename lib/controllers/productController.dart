import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pos_app/constants/constant_app.dart';
import 'package:get/get.dart';

import '../database/database_item.dart';
import '../models/item.dart';

class ProducsController extends GetxController {
  static ProducsController instance = Get.find();

  //var productItem = <ProductItem>[].obs;
  var productItem = List<ProductItem>().obs;
  RxList<ProductItem> products = RxList<ProductItem>([]);
  //List<ProductItem> productItem = [];

  @override
  void onInit() {
    addData(ProductItem(
        image: '',
        name: 'Ga Xoi Mo',
        quantity: 10,
        price: 100,
        category: 'Food'));
    addData(ProductItem(
        image: '',
        name: 'Ga Xoi Mo',
        quantity: 10,
        price: 100,
        category: 'Food'));
    addData(ProductItem(
        image: '',
        name: 'Ga Xoi Mo',
        quantity: 10,
        price: 100,
        category: 'Food'));

    super.onInit();
  }

  @override
  void onReady() {
    _getData();
    logger.i({"LOI1": productItem.length});
    super.onReady();
  }

  void _getData() {
    logger.i({"LOI3"});
    DatabaseHelper.instance.queryAllRows().then((value) {
      logger.i({"LOI2": value.length});
      for (var element in value) {
        productItem.add(ProductItem(
            id: element['id'],
            image: element['image'],
            name: element['title'],
            quantity: element['quantity'],
            price: element['price'],
            category: element['category']));
      }
    });
  }

  void addData(ProductItem productItem) async {
    await DatabaseHelper.instance.insert(productItem);
    // productItem.insert(
    //     0, ProductItem(id: productItem.length, name: addTaskController.text));
  }

  void deleteTask(int id) async {
    await DatabaseHelper.instance.delete(id);

    productItem.removeWhere((element) => element.id == id);
  }
}

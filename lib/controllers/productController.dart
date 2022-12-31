import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_pos_app/constants/constant_app.dart';
import 'package:flutter_pos_app/models/product_item.dart';
import 'package:get/get.dart';

import '../database/database.dart';
import '../entity/item.dart';

class ProductsController extends GetxController {
  static ProductsController instance = Get.find();
  late AppDatabase appDatabase;
  RxList<ProductItem> products = RxList<ProductItem>([]);

  @override
  void onInit() {
    appDatabase = Get.find();
    addDatafrJson();
    loadData();
    super.onInit();
  }
  
  void loadData() {
    products.bindStream(appDatabase.itemDAO.getAllItems());
  }
  
  void addDatafrJson() {
    List<ProductItem> items = [];
    readJsonDatabase().then((value) => items = value);
    for(ProductItem item in items){
      appDatabase.itemDAO.insertItem(item);
    }
  }

  Future<List<ProductItem>> readJsonDatabase() async{
    final rawData = await rootBundle.rootBundle.loadString('assets/data/virtual_item.json');
    final list = json.decode(rawData) as List<dynamic>;
    return list.map((model) => ProductItem.fromJson(model)).toList();
  }
}

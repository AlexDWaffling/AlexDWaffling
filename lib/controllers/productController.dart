import 'dart:convert';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter_pos_app/constants/constant_app.dart';
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
    // deleteAllItem();
    addDatafrJson();
    loadData();
    //printInfo(printFunction: loadData);
    // for (var element in products) {
    //   logger.i({"Products": element.toString()});
    // }
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    // loadData();
    super.onReady();
  }

  RxList<ProductItem> getAllItemsByCategory(String category){
    Future<List<ProductItem>> productItemByCtg = appDatabase.itemDAO.getAllItemsByCategory(category);
    RxList<ProductItem> itemsCtg = RxList<ProductItem>([]);
    productItemByCtg.then((value) => itemsCtg.addAll(value)); 
    return itemsCtg;
  }


  void loadData() {
    appDatabase.itemDAO.getAllItems().then((value) => products.addAll(value));
    //products.bindStream(appDatabase.itemDAO.getAllItems().asStream());
    // logger.i({"Products": products.length});
  }

  void addDatafrJson() {
    //final List<ProductItem> items = [];
    readJsonDatabase().then((value) {
      for (ProductItem item in value) {
        appDatabase.itemDAO.insertItem(item);
        //logger.i({"Items": item.toString()});
      }
      //items.addAll(value);
    });
    //logger.i({"Item11": items.length});
  }

  Future<List<ProductItem>> readJsonDatabase() async {
    final rawData = await rootBundle.rootBundle.loadString('assets/data/virtual_item.json');
    // logger.i({"rawData": rawData.toString()});
    List<dynamic> list = jsonDecode(rawData);
    List<ProductItem> pItem = List<ProductItem>.from(list.map<ProductItem>((model) => ProductItem.fromJson(model)));
    // for(var item in pItem){
    //   logger.i({"list": item.toString()});
    // }

    return pItem;
  }
  
  void deleteAllItem() {
    appDatabase.itemDAO.deleteAllItem();
  }

  // Future<List<ProductItem>>


}

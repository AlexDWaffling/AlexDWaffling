// import 'dart:convert';

// import 'package:get/get.dart';
// import '../models/model_bar.dart';
// import 'package:flutter/services.dart' as rootBundle;

// class BarController extends GetxController {
//   static BarController instance = Get.find();
//   RxList<ItemModelBar> modelBar = RxList<ItemModelBar>([]);

//   @override
//   void onInit() {
//     addDatafrJson();
//     super.onInit();
//   }

//   void addDatafrJson() {
//     List<ItemModelBar> items = [];
//     readJsonDatabase().then((value) => items = value);
//   }

//   Future<List<ItemModelBar>> readJsonDatabase() async{
//     final rawData = await rootBundle.rootBundle.loadString('assets/data/main_items_data.json');
//     final list = json.decode(rawData) as List<dynamic>;
//     return list.map((model) => ItemModelBar.fromJson(model)).toList();
//   }

// }
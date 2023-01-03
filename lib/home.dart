import 'package:flutter/material.dart';
import 'package:flutter_pos_app/controllers/productController.dart';
import 'package:flutter_pos_app/entity/item.dart';
import 'package:flutter_pos_app/models/model_tab.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'page/cocktail.dart';
import 'page/drink.dart';
import 'page/main_dish.dart';
import 'page/side_dish.dart';
import 'page/wine.dart';

import 'widgets/item_order.dart';
import 'widgets/item_tab.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_title.dart';

class HomePage extends StatefulWidget {
  // List<ProductItem> cItem = [];
  const HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductsController _productsController = Get.put(ProductsController());
  List<ProductItem> cItem = [];
  // _HomePageState(this.cItem);
  void collectItem(ProductItem _productItem) {
    setState(() {
      cItem.add(_productItem);
    });
  }
  String pageActive = 'Main Dish';
  _tabpageView() {
    switch (pageActive) {
      case 'Main Dish':
        return mainDishTab(cItem: cItem, getFunc: collectItem);
      case 'Side Dish':
        return sideDishTab(cItem: cItem, getFunc: collectItem);
      case 'Drink':
        return drinkTab(cItem: cItem, getFunc: collectItem);
      case 'Cocktail':
        return cocktailTab(cItem: cItem, getFunc: collectItem);
      case 'Wine':
        return wineTab(cItem: cItem, getFunc: collectItem);

      default:
        return mainDishTab(cItem: cItem, getFunc: collectItem);
    }
  }
  _setTabPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              topTitle(
                title: 'Lorem Restourant',
                subTitle: '20 October 2022',
                action: const searchBar(),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Consumer<ItemModelTab>(builder: (context, value, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.main_items_tab.length,
                    itemBuilder: (context, index){
                      return itemTab(
                        icon: value.main_items_tab[index][1], 
                        title: value.main_items_tab[index][0], 
                        isActive: false,
                        tap: (){
                          _setTabPage(value.main_items_tab[index][0]);
                        }
                      );
                    }
                  );
              })),
              Expanded(
                child: _tabpageView()
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              topTitle(
                title: 'Order',
                subTitle: 'Table 8',
                action: Container(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: cItem.length,
                  itemBuilder: (context, index) {
                    return itemOrder(
                        image: cItem[index].image,
                        title: cItem[index].name,
                        price: cItem[index].price,
                        qty: cItem[index].quantity.toString()
                    );
                  }
                )
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xff1f2029),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Sub Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$ABC',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Tax',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$abc',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 2,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Total',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$XXX',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.print, size: 16),
                            SizedBox(width: 6),
                            Text('Print Bills')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

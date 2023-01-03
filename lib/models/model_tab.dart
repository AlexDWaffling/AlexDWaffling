import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemModelTab extends ChangeNotifier{
  final List _main_items_tab = [
    //[name, icon]
    ["Main Dish",Icons.rocket_sharp],
    ["Side Dish",Icons.format_list_bulleted_rounded],
    ["Drink",Icons.history_toggle_off_rounded], 
    ["Cocktail",Icons.discount_outlined],
    ["Wine",Icons.wine_bar],
  ];
  get main_items_tab => _main_items_tab;
}
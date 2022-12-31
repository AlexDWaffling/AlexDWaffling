import 'package:floor/floor.dart';
import 'package:flutter_pos_app/entity/item.dart';
import 'package:flutter_pos_app/models/product_item.dart';

@dao
abstract class ItemDAO{
  @Query('SELECT * FROM ProductItem')
  Stream<List<ProductItem>> getAllItems();

  @insert
  Future<void> insertItem(ProductItem productItem);

  @update
  Future<void> updateItem(ProductItem productItem);

  @delete
  Future<void> deleteItem(ProductItem productItem);

}

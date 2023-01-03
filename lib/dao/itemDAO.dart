import 'package:floor/floor.dart';
import 'package:flutter_pos_app/entity/item.dart';

@dao
abstract class ItemDAO{
  @Query('SELECT * FROM ProductItem')
  Future<List<ProductItem>> getAllItems();

  @Query('SELECT * FROM ProductItem WHERE category =:category')
  Future<List<ProductItem>> getAllItemsByCategory(String category);

  @insert
  Future<void> insertItem(ProductItem productItem);

  @update
  Future<void> updateItem(ProductItem productItem);

  @delete
  Future<void> deleteItem(ProductItem productItem);

  @Query('DELETE FROM ProductItem')
  Future<void> deleteAllItem();

}

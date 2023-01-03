// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
      json['id'] as int,
      json['image'] as String,
      json['name'] as String,
      json['quantity'] as int,
      json['price'] as String,
      json['category'] as String,
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
      'quantity': instance.quantity,
    };

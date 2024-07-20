// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      quantity: (json['quantity'] as num).toInt(),
      cost: (json['cost'] as num).toDouble(),
      productId: json['productId'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'quantity': instance.quantity,
      'cost': instance.cost,
      'productId': instance.productId,
      'price': instance.price,
    };

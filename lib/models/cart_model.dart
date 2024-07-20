// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class CartItemModel {
  String id;
  String name;
  String image;
  int quantity;
  double cost;
  String productId;
  double price;

  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.cost,
    required this.productId,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  @override
  String toString() {
    return 'CartItemModel(id: $id, name: $name, quantity: $quantity)';
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class ProductModel {
  String id;
  String image;
  String name;
  String brand;
  double price;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.brand,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, brand: $brand)';
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'cart_model.dart';

part 'user_model.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class UserModel {
  String id;
  String name;
  String email;
  List<CartItemModel> cart;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cart,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'userModel(id: $id, name: $name, email: $email, cart: $cart)';
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'cart_model.dart';

part 'payments_model.g.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class PaymentsModel {
  String id;
  double amount;
  String status;
  List<CartItemModel> cart;

  PaymentsModel({
    required this.id,
    required this.amount,
    required this.status,
    required this.cart,
  });

  factory PaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentsModelToJson(this);

  @override
  String toString() {
    return 'PaymentsModel(id: $id, amount: $amount, status: $status)';
  }
}

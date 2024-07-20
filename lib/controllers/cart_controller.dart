// ignore_for_file: avoid_print

import 'package:e_shopping/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  final UserController userController = UserController.instance;
  RxDouble totalCartPrice = 0.0.obs;
  RxBool isLoading = false.obs;

  @override
  onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added");
      } else {
        String itemId = const Uuid().toString();
        userController.updateUserData(
          CartItemModel(
            id: itemId,
            name: product.name,
            image: product.image,
            quantity: 1,
            cost: product.price,
            productId: product.id,
            price: product.price,
          ),
        );
        Get.snackbar("Item added", "${product.name} was added to your cart");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot add this item");
      debugPrint(e.toString());
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      userController.userModel.value.cart
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item) {
    item.quantity--;
    item.cost = item.quantity * item.price;
    if (item.quantity == 0) {
      Get.snackbar("Item removed", "${item.name} was removed to your cart");
    }
    userController.updateUserData(
      item,
      add: false,
    );
  }

  void increaseQuantity(CartItemModel item) {
    item.quantity++;
    item.cost = item.quantity * item.price;
    userController.updateUserData(
      item,
      add: false,
    );
  }

  void changeCartTotalPrice(UserModel userModel) {
    if (userModel.cart.isNotEmpty) {
      double totalCart = 0.0;

      for (var cartItem in userModel.cart) {
        totalCart += cartItem.cost;
      }
      totalCartPrice.value = totalCart;
    }
  }
}

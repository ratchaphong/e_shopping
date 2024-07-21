// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  RxBool isLoading = false.obs;
  Rx<UserModel> userModel = UserModel(
    id: '',
    name: '',
    email: '',
    cart: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void updateUserData(CartItemModel cartItem, {bool add = true}) {
    List<CartItemModel> updatedCart = List.from(userModel.value.cart);
    if (add) {
      updatedCart.add(cartItem);
    } else {
      updatedCart.removeWhere((item) => item.productId == cartItem.productId);
      if (cartItem.quantity > 0) {
        updatedCart.add(cartItem);
      }
    }
    userModel.update((user) {
      user?.cart = updatedCart;
    });
  }
}

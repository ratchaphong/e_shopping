import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'cart_item_widget.dart';

class ShoppingCartWidget extends StatelessWidget {
  final CartController cartController = CartController.instance;
  final UserController userController = UserController.instance;

  ShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          ListView(
            children: [
              Center(
                child: CustomText(
                  text: "Shopping Cart",
                  size: FontSizes.sizeLg,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(
                () => Column(
                  children: userController.userModel.value.cart
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                            increaseQuantity: cartController.increaseQuantity,
                            decreaseQuantity: cartController.decreaseQuantity,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 32,
            child: Container(
              width: MediaQuery.of(context).size.width - (16.0 * 2),
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => CustomButton(
                    text:
                        "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                    onTap: () {
                      // paymentsController.createPaymentMethod();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

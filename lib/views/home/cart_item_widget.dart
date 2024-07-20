import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

import '../../models/cart_model.dart';
import '../../widgets/custom_text.dart';

class CartItemWidget extends StatefulWidget {
  final CartItemModel cartItem;
  final void Function(CartItemModel item) increaseQuantity;
  final void Function(CartItemModel item) decreaseQuantity;

  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.increaseQuantity,
    required this.decreaseQuantity,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.cartItem.image,
              width: 64,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Container(
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: CustomText(
                          text: widget.cartItem.name,
                        )),
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              widget.decreaseQuantity(widget.cartItem);
                            }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: widget.cartItem.quantity.toString(),
                          ),
                        ),
                        IconButton(
                            icon: const Icon(Icons.chevron_right),
                            onPressed: () {
                              widget.increaseQuantity(widget.cartItem);
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            CustomText(
              text: "\$${widget.cartItem.cost}",
              size: FontSizes.sizeLg,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../utilities/controllers.dart';
import '../../../widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorResources.white1,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 8)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height /
                      8, // Set the height to 1/8 of the screen height
                  width: MediaQuery.of(context)
                      .size
                      .width, // Optional: to make image take full width of the screen or grid column
                  child: Image.network(
                    product.image,
                    fit: BoxFit
                        .cover, // Changed to BoxFit.cover to ensure the image covers the full container
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            CustomText(
              text: product.brand,
              color: Colors.grey,
            ),
            CustomText(
              text: product.name,
              size: FontSizes.sizeLg,
              weight: FontWeight.bold,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$${product.price}",
                  size: FontSizes.sizeLg,
                  weight: FontWeight.bold,
                ),
                IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cartController.addProductToCart(product);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}

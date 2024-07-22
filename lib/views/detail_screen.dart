import 'package:e_shopping/models/product_model.dart';
import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

import '../../utilities/controllers.dart';
import '../../widgets/custom_text.dart';
import '../widgets/custom_button.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: ColorResources.white1,
        iconTheme: const IconThemeData(color: ColorResources.black1),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: ColorResources.white2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.white3,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: const Offset(3, 2),
                        blurRadius: 8)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: product.name,
                        size: FontSizes.sizeBase,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: product.brand,
                        size: FontSizes.sizeXs,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomText(
                        text: "\$ ${product.price.toStringAsFixed(2)}",
                        size: FontSizes.sizeLg,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomText(
                        text:
                            "Dolor elit est elit consectetur occaecat tempor do cupidatat pariatur labore duis veniam laboris ipsum. Culpa fugiat aliquip quis ad dolore magna. Ipsum ipsum eiusmod ipsum dolore dolor pariatur magna ipsum non laboris qui aliqua deserunt. Incididunt pariatur est aute id fugiat aliqua non eiusmod ex ipsum consectetur id culpa do.",
                        size: FontSizes.sizeBase,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: CustomButton(
                              text: "Order Now",
                              onTap: () {
                                cartController.addProductToCart(product);
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

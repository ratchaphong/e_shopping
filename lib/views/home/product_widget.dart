import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import 'single_product_widget.dart';

class ProductsWidget extends StatelessWidget {
  final ProductController productController = ProductController.instance;

  ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // Assuming the width of each item is half the screen width in a 2-column grid
    double itemWidth = MediaQuery.of(context).size.width / 2;
    // Set the childAspectRatio based on desired height which is half the screen height
    double childAspectRatio = itemWidth / (screenHeight / 2);

    return Obx(
      () => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 12,
        children: productController.products.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList(),
      ),
    );
  }
}

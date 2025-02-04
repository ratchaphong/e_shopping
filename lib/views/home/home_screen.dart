import 'package:e_shopping/utilities/theme.dart';
import 'package:e_shopping/views/home/widget/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../utilities/controllers.dart';
import '../../widgets/custom_text.dart';
import 'widget/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.white1,
        iconTheme: const IconThemeData(color: ColorResources.black1),
        title: CustomText(
          text: "Sneex",
          size: FontSizes.sizeLg,
          weight: FontWeight.bold,
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    color: ColorResources.white1,
                    child: const ShoppingCartWidget(),
                  ),
                );
              })
        ],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: ColorResources.white2,
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(() => UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: ColorResources.black1),
                  accountName: Text(
                    userController.userModel.value.name,
                  ),
                  accountEmail: Text(
                    userController.userModel.value.email,
                  ),
                )),
            ListTile(
              leading: const Icon(Icons.book),
              title: const CustomText(
                text: "Payments History",
              ),
              onTap: () async {
                paymentsController.getPaymentHistory();
              },
            ),
            ListTile(
              onTap: () {
                loginController.signOut();
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Log out"),
            ),
          ],
        ),
      ),
      body: ProductsWidget(),
    );
  }
}

import 'package:e_shopping/controllers/login_controller.dart';
import 'package:e_shopping/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(LoginController());
  Get.put(ProductController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your Project Name',
      initialRoute: '/',
      getPages: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

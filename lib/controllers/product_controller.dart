// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList<ProductModel> products = RxList<ProductModel>([]);
  String collection = "products";
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();

    getAllProducts();
  }

  void getAllProducts() async {
    isLoading(true);
    try {
      products(
        [
          ProductModel(
            id: '1',
            image:
                'https://i.ebayimg.com/images/g/jfMAAOSw5KZgn14q/s-l1600.jpg',
            name:
                '1982 Nike Cortez Vintage Running Shoes Forrest Gump Korea Sz 13.5',
            brand: 'Nike',
            price: 352.75,
          ),
          ProductModel(
            id: '2',
            image:
                'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTZqROrWIztTazMbyBkbRJpEjdWafUw5NdiGWSggNZacyFG8PkMzZIc8g4VYyRZSbvcKyzvL5MGQ_QvxnWHoVOiboAk_3lY3jh9OuGIOaGmNmCp9A4EOuKvUw&usqp=CAE',
            name:
                'Nike Air Jordan 1 Mid Aj1 Aqua Men Casual Lifestyle Shoes Sneakers',
            brand: 'Nike',
            price: 76.99,
          ),
          ProductModel(
            id: '3',
            image:
                'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQVUJ35Cy6cMmO_m3oZ4PQV27QX7PjtLHFbowJIdoe5VJGWPO6VhXOJiWhMX9IaX8_hk_CXhtT6-gTSiYHTfkRIm8kU5F4guCCAWzxujZ9FThIEf56-MsjfNg&usqp=CAE',
            name: '	Adidas Men\'s Ozweego Shoes, Color Options',
            brand: 'Adidas',
            price: 66.0,
          )
        ],
      );
      isLoading(false);
    } catch (e) {
      isLoading(false);
      Get.snackbar('Schedule Failed', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

// ignore_for_file: avoid_print

import 'package:e_shopping/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/payments_model.dart';
import '../views/payment/payment_screen.dart';

class PaymentController extends GetxController {
  static PaymentController instance = Get.find();

  String collection = "payments";
  RxBool isLoading = false.obs;
  List<PaymentsModel> payments = [];

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  Future<void> createPaymentMethod() async {}

  void getPaymentHistory() {
    payments.clear();
    String id = const Uuid().toString();
    String cartId = const Uuid().toString();
    List<CartItemModel> cart = [
      CartItemModel(
        id: cartId,
        name:
            '1982 Nike Cortez Vintage Running Shoes Forrest Gump Korea Sz 13.5',
        image: 'https://i.ebayimg.com/images/g/jfMAAOSw5KZgn14q/s-l1600.jpg',
        quantity: 2,
        cost: 352.75 * 2,
        productId: '1',
        price: 352.75,
      ),
      CartItemModel(
        id: cartId,
        name:
            'Nike Air Jordan 1 Mid Aj1 Aqua Men Casual Lifestyle Shoes Sneakers',
        image:
            'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTZqROrWIztTazMbyBkbRJpEjdWafUw5NdiGWSggNZacyFG8PkMzZIc8g4VYyRZSbvcKyzvL5MGQ_QvxnWHoVOiboAk_3lY3jh9OuGIOaGmNmCp9A4EOuKvUw&usqp=CAE',
        quantity: 1,
        cost: 76.99 * 1,
        productId: '2',
        price: 76.99,
      ),
    ];
    double totalAmount = cart.fold(0, (sum, item) => sum + item.cost);

    payments.addAll([
      PaymentsModel(
        id: id,
        amount: totalAmount,
        status: 'APPROVED',
        cart: cart,
      ),
      PaymentsModel(
        id: id,
        amount: totalAmount,
        status: 'CANCELLED',
        cart: cart,
      )
    ]);
    Get.to(() => const PaymentsScreen());
  }
}

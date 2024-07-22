import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../models/payments_model.dart';
import '../../../widgets/custom_text.dart';

class PaymentWidget extends StatelessWidget {
  final PaymentsModel paymentsModel;

  const PaymentWidget({
    super.key,
    required this.paymentsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ColorResources.white1,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 16,
            )
          ]),
      child: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const CustomText(
                  text: "ITEMS:",
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomText(
                    text: paymentsModel.cart.length.toString(),
                    color: Colors.black,
                    weight: FontWeight.bold,
                  ),
                ),
                Expanded(child: Container()),
                CustomText(
                  text: "\$ ${paymentsModel.amount}",
                  color: ColorResources.black1,
                  weight: FontWeight.bold,
                  size: FontSizes.sizeLg,
                ),
              ],
            ),
          ),
          const Divider(),
          Column(
              children: paymentsModel.cart
                  .map((item) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                text: item.name,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: CustomText(
                                  text: "\$ ${item.cost}",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList()),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: returnDate(),
                  color: Colors.grey,
                ),
                CustomText(
                  text: paymentsModel.status,
                  color: paymentsModel.status == 'APPROVED'
                      ? ColorResources.darkGreen1
                      : ColorResources.red1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String returnDate() {
    DateTime date = DateTime.now();
    return timeago.format(date, locale: 'fr');
  }
}

import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

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
                  .map((item) => ListTile(
                        title: CustomText(
                          text: item.name,
                        ),
                        trailing: CustomText(
                          text: "\$ ${item.cost}",
                        ),
                      ))
                  .toList()),
          const Divider(),
          // CustomText(
          //   text: _returnDate(),
          //   color: Colors.grey,
          // ),
          CustomText(
            text: paymentsModel.status,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  // String _returnDate() {
  //   DateTime date =
  //       new DateTime.fromMillisecondsSinceEpoch(paymentsModel.createdAt);
  //   return timeago.format(date, locale: 'fr');
  // }
}

import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

import '../../utilities/controllers.dart';
import '../../widgets/custom_text.dart';
import 'widget/payment_widget.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        // backgroundColor: Colors.grey.withOpacity(.1),
        backgroundColor: ColorResources.white1,
        iconTheme: const IconThemeData(color: ColorResources.black1),
        centerTitle: true,
        elevation: 0,
        // title: const Text(
        //   "Payment History",
        //   style: TextStyle(color: ColorResources.black1),
        // ),
        title: CustomText(
          text: "Payment History",
          color: ColorResources.black1,
          size: FontSizes.sizeBase,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: paymentsController.payments
              .map((payment) => PaymentWidget(
                    paymentsModel: payment,
                  ))
              .toList(),
        ),
      ),
      backgroundColor: ColorResources.white1,
    );
  }
}

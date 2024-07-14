import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

class BottomTextWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text1;
  final String text2;

  const BottomTextWidget(
      {super.key,
      required this.onTap,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: const TextStyle(
              color: ColorResources.black1,
            )),
        TextSpan(
            text: " $text2",
            style: TextStyle(
              // color: ColorResources.lightGreen1,
              color: Colors.grey.withOpacity(.3),
            ))
      ])),
    );
  }
}

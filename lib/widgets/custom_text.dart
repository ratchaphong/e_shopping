import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText(
      {super.key, required this.text, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size ?? FontSizes.sizeBase,
          color: color ?? ColorResources.black1,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}

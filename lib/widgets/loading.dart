import 'package:e_shopping/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.white1,
      child: const SpinKitFadingCircle(
        color: ColorResources.black1,
        size: 32,
      ),
    );
  }
}

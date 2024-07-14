import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../gen/assets.gen.dart';
import '../utilities/theme.dart';
import 'buttom_text_widget.dart';
import 'login.dart';
import 'registration.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = LoginController.instance;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white1,
      body: Obx(
        () {
          if (loginController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: ColorResources.black1,
            ));
          }

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width / 3),
                  // Image.asset(
                  //   logo,
                  //   width: 200,
                  // ),
                  Assets.images.logo.image(
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  Visibility(
                    visible: !loginController.isLoginWidgetDisplayed.value,
                    child: LoginWidget(),
                  ),
                  Visibility(
                    visible: loginController.isLoginWidgetDisplayed.value,
                    child: RegistrationWidget(),
                  ),
                  Visibility(
                    visible: !loginController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        loginController.changeDisplayedAuthWidget();
                      },
                      text1: "Don't have an account?",
                      text2: "Create account!",
                    ),
                  ),
                  Visibility(
                    visible: loginController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        loginController.changeDisplayedAuthWidget();
                      },
                      text1: "Already have an account?",
                      text2: "Sign in!!",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:e_shopping/utilities/controllers.dart';
import 'package:e_shopping/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/user_model.dart';
import '../views/home/home_screen.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  RxBool isLoginWidgetDisplayed = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  void clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void signIn() async {
    try {
      // showLoading();
      String userId = const Uuid().toString();
      UserModel data = UserModel(
        id: userId,
        name: 'Mark Suckerberg',
        email: 'suckerberg@gmail.com',
        cart: [],
      );
      userController.setUserData(data);
      clearControllers();
      Get.offAll(() => const HomeScreen());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    // showLoading();
    try {
      // await auth
      //     .createUserWithEmailAndPassword(
      //         email: email.text.trim(), password: password.text.trim())
      //     .then((result) {
      //   String _userId = result.user.uid;
      //   _addUserToFirestore(_userId);
      //   _clearControllers();
      // });
      clearControllers();
      changeDisplayedAuthWidget();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    UserModel data = UserModel(
      id: "",
      name: '',
      email: '',
      cart: [],
    );
    userController.setUserData(data);
    Get.offAll(() => const LoginScreen());
  }
}

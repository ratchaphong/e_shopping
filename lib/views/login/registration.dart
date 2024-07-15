import 'package:flutter/material.dart';

import '../../controllers/login_controller.dart';
import '../../utilities/theme.dart';
import '../../widgets/custom_button.dart';

class RegistrationWidget extends StatelessWidget {
  final LoginController loginController = LoginController.instance;

  RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: ColorResources.white1,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 8,
            )
          ],
          borderRadius: BorderRadius.circular(24)),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey.withOpacity(.3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextField(
                controller: loginController.name,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  fillColor: ColorResources.white1,
                  border: InputBorder.none,
                  hintText: "Name",
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey.withOpacity(.3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextField(
                controller: loginController.email,
                decoration: const InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    fillColor: ColorResources.white1,
                    border: InputBorder.none,
                    hintText: "Email"),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey.withOpacity(.3),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: TextField(
                controller: loginController.password,
                decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    fillColor: ColorResources.white1,
                    border: InputBorder.none,
                    hintText: "Password"),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: CustomButton(
              text: "Register",
              onTap: () {
                loginController.signUp();
              },
            ),
          )
        ],
      ),
    );
  }
}

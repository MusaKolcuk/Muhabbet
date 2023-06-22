import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/utils/theme_data.dart';

import '../../widgets/login_images.dart';
import '../../widgets/textfield_widget.dart';
import '../constants.dart';
import '../controller/register_controller.dart';
import '../widgets/text_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController _registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget spacer015() {
      return SizedBox(
        height: h * 0.015,
      );
    }

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.15),
              child: Column(children: [
                LoginImages(
                  text: registerText,
                  imageAsset: app_logo,
                ),
                TextFieldWidget(
                  isPassword: false,
                  hint: fullName,
                  controller: _registerController.nameController,
                ),
                spacer015(),
                TextFieldWidget(
                  isPassword: false,
                  hint: emailText,
                  controller: _registerController.emailController,
                ),
                spacer015(),
                TextFieldWidget(
                    isPassword: true,
                    hint: passwordText,
                    controller: _registerController.passwordController),
                spacer015(),
                MyTextButton(
                    text: registerText,
                    onPressed: _registerController.register),
                spacer015(),
                doYouHaveAcc(context),
                spacer015(),
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  Row doYouHaveAcc(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          doYouHaveAccountText,
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            loginText,
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/constants.dart';
import 'package:muhabbet/utils/theme_data.dart';

import '../controller/login_controller.dart';
import '../widgets/login_images.dart';
import '../widgets/text_button.dart';
import '../widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Widget spacer002() {
      return SizedBox(
        height: h * 0.02,
      );
    }

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
                  imageAsset: app_logo,
                  text: loginText,
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                TextFieldWidget(
                  isPassword: false,
                  hint: emailText,
                  controller: _loginController.emailController,
                ),
                spacer002(),
                TextFieldWidget(
                    isPassword: true,
                    hint: passwordText,
                    controller: _loginController.passwordController),
                spacer015(),
                MyTextButton(
                    text: loginText,
                    onPressed: () {
                      _loginController.login();
                    }),
                spacer015(),
                dontHaveAcc(context),
                spacer015(),
                forgotPassword(),
              ]),
            ),
          ],
        ),
      ),
    ));
  }

  Row dontHaveAcc(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          dontHaveAccountText,
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed('/register');
          },
          child: Text(
            registerText,
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Row forgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed('/forgotPassword');
          },
          child:
              Text(forgotPasswordText, style: TextStyle(color: secondaryColor)),
        )
      ],
    );
  }
}

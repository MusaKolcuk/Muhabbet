import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/utils/theme_data.dart';

import '../../widgets/login_images.dart';
import '../../widgets/textfield_widget.dart';
import '../constants.dart';
import '../controller/forgot_password_controller.dart';
import '../widgets/text_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final PasswordResetController _passwordResetController =
      Get.put(PasswordResetController());

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
                  imageAsset: asset_mail_man,
                  text: forgot_password_title,
                ),
                spacer015(),
                TextFieldWidget(
                  isPassword: false,
                  hint: emailText,
                  controller: _passwordResetController.emailController,
                ),
                spacer015(),
                MyTextButton(
                    text: send_password_to_email,
                    onPressed: () {
                      _passwordResetController.sendPasswordResetEmail();
                    }),
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/utils/theme_data.dart';

import '../controller/login_controller.dart';

class MyTextButton extends StatefulWidget {
  String text;
  Function()? onPressed;
  MyTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MyTextButton> createState() => _MyTextButtonState();
}

class _MyTextButtonState extends State<MyTextButton> {
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return TextButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size(w, h * 0.06)),
            backgroundColor: MaterialStateProperty.all(primaryColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        child: Obx(() => Container(
            child: loginController.loading == true
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))));
  }
}
//sC.loginText
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/all_controller.dart';


class TextFieldWidget extends StatefulWidget {
  String hint;
  bool isPassword;
  TextEditingController controller;
  bool? isCreateOrJoin;
  TextFieldWidget({
    Key? key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.isCreateOrJoin,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final AllController _allController = Get.put(AllController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        onSubmitted: (value) {
          textInputAction: TextInputAction.next;
        },
        keyboardType: widget.hint == "Email"
            ? TextInputType.emailAddress
            : TextInputType.text,
        obscureText: _allController.isObscure && widget.isPassword,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: widget.isCreateOrJoin != null
              ? const EdgeInsets.all(20)
              : ThemeData().inputDecorationTheme.contentPadding,
          hintText: widget.hint,
          suffixIcon: widget.hint == "Password"
              ? IconButton(
                  enableFeedback: false,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    _allController.changeIsObscure();
                  },
                  icon: Icon(_allController.isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined),
                )
              : null,
        )));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnackBar(
    String snackText, String responseBody, Color bgColor, Color textColor) {
  var error = json.decode(responseBody)['message'];
  Get.snackbar(
    snackText,
    error.toString(),
    backgroundColor: bgColor,
    colorText: textColor,
  );
}

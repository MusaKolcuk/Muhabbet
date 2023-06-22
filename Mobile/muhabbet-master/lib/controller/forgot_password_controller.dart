import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../screens/login_screen.dart';
import 'constants.dart';

class PasswordResetController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  void sendPasswordResetEmail() async {
    // E-posta adresini al
    String email = emailController.text;

    // HTTP GET isteği gönderme
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/forgotpassword/'),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: json.encode({"email": email}),
      );

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        // Başarılı bir şekilde istek gönderildiyse

        // Snackbar ile mesaj gösterme
        Get.snackbar(
          password_reset,
          password_reset_email_sent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Şifremi unuttum ekranından login ekranına yönlendirme
        Get.offAll(const LoginScreen());
      } else {
        // İstek başarısız olduysa
        // Hata mesajını snackbar ile gösterme
        Get.snackbar(
          error,
          password_reset_failed,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Hata oluştuğunda
      // Hata mesajını snackbar ile gösterme
      Get.snackbar(
        error,
        password_reset_failed,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/register_model.dart';
import 'constants.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController =
      TextEditingController(text: kDebugMode ? "muhammet" : "");
  final TextEditingController emailController = TextEditingController(
      text: kDebugMode ? "muhammetaydin1704@gmail.com" : "");
  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "123456" : "");

  final TextEditingController registerValidateCodeController =
      TextEditingController();
  final GetStorage box = GetStorage();

  var registerModel = RegisterModel().obs;

  void register() async {
    // Kullanıcının girdiği verileri al
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar(
        error,
        please_fill_all_fields,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    } else if (password.length < 6) {
      Get.snackbar(
        error,
        pasword_must_be_at_least_6_characters,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // HTTP POST isteği gönderme
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/users/create'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        registerModel.value = RegisterModel.fromJson(response.body);

        // Snackbar ile mesaj gösterme
        Get.snackbar(
          registerText,
          register_succ_login,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Kayıt ekranından login ekranına yönlendirme
        //TODO: BURADA NORMALDE LOGINE AMA ARTIK KONTROL
        Get.toNamed('/register_validation');
      } else {
        var errorJson = json.decode(response.body);
        var errorMessage = errorJson['message'];
        // İstek başarısız olduysaü
        //'Kayıt işlemi başarısız oldu.'
        // Hata mesajını snackbar ile gösterme
        Get.snackbar(
          error,
          errorMessage ?? register_failed,
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
        register_error_occurred,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> validate_register() async {
    String? tokenFromModel =
        Get.find<RegisterController>().registerModel.value.accessToken;
    // Kullanıcının girdiği verileri al
    var headers = {
      'Authorization': 'Bearer: $tokenFromModel',
      'Content-Type': 'application/json'
    };

    if (kDebugMode) {
      print(registerValidateCodeController.text);
    }

    // HTTP POST isteği gönderme
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/api/users/verify-account'),
        headers: headers,
        body: json.encode({
          'verificationCode': registerValidateCodeController.text,
        }),
      );

      if (response.statusCode == 200) {
        // registerModel.value = RegisterModel.fromJson(response.body);
        Get.offAllNamed('/login');

        // Snackbar ile mesaj gösterme
        Get.snackbar(
          registerText,
          register_succ_login,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Kayıt ekranından login ekranına yönlendirme
        //TODO: BURADA NORMALDE LOGINE AMA ARTIK KONTROL
      } else {
        var errorJson = json.decode(response.body);
        var errorMessage = errorJson['message'];
        // İstek başarısız olduysaü
        //'Kayıt işlemi başarısız oldu.'
        // Hata mesajını snackbar ile gösterme
        Get.snackbar(
          error,
          errorMessage ?? register_failed,
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
        register_error_occurred,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

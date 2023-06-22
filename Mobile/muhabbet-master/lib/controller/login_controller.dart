import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:muhabbet/controller/new_contact_controller.dart';
import 'package:muhabbet/controller/register_controller.dart';

import '../constants.dart';
import '../model/login_model.dart';
import '../model/register_model.dart';
import '../widgets/error_snackbar.dart';
import 'constants.dart';

class LoginController extends GetxController {
  final _emailController = TextEditingController(
      text: kDebugMode ? "muhammetaydin1704@gmail.com" : "");
  final _passwordController =
      TextEditingController(text: kDebugMode ? "123456" : "");
  final GetStorage box = GetStorage();
  final _loading = false.obs;
  var loginModel = LoginModel().obs;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get loading => _loading.value;

  Future<void> login() async {
    _loading.value = true;
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );
      _loading.value = false;
      if (response.statusCode == 200) {
        NewContactController newContactController =
            Get.put(NewContactController());
        newContactController.fetchContact();

        _loading.value = false;
        loginModel.value = LoginModel.fromJson(response.body);
        box.write('token', loginModel.value.access_token);
        box.write("json", response.body);
        kDebugMode ? print(loginModel.value.access_token) : null;
        Navigator.of(Get.context!)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
        Get.snackbar("Success", "You have successfully logged in.",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        _loading.value = false;
        Get.snackbar("Error", response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // fetch login model

  Future<void> fetchdata() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      http.Response response = await http.post(
        Uri.parse('$baseUrl/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}),
      );
      if (response.statusCode == 200) {
        loginModel.value = LoginModel.fromJson(response.body);
      } else {
        Get.snackbar("Error", response.reasonPhrase.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  isLoggedIn() {
    if (box.read('token') != null) {
      if (box.read('json') != null) {
        loginModel.value = LoginModel.fromJson(box.read('json'));
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

  deleteUser() async {
    RegisterController registerController = Get.put(RegisterController());

    String? userId = Get.find<LoginController>().loginModel.value.data?.id;
    String? tokenFromModel =
        Get.find<LoginController>().loginModel.value.access_token;

    var requestUrl = '$baseUrl/api/users/$userId';
    var headers = {
      'Authorization': 'Bearer: $tokenFromModel',
      'Content-Type': 'application/json'
    };

    try {
      var response = await http.delete(Uri.parse(requestUrl), headers: headers);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        getSnackBar(group_created, response.body, Colors.green, Colors.black);
        box.remove('token');
        box.remove('json');
        loginModel.value = LoginModel();
        registerController.registerModel.value = RegisterModel();
        Get.offAllNamed('/login');
      } else {
        getSnackBar(error, response.body, Colors.red, Colors.white);
      }
    } catch (error) {
      // Hata durumunda
      Get.snackbar(
        'Hata',
        'Bir hata oluştu: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

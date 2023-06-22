// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class SettingsController extends GetxController {
//   final _isChangingPassword = false.obs;
//   bool get isChangingPassword => _isChangingPassword.value;
//   changeIsChangingPassword() {
//     //switches the value of isChangingPassword
//     _isChangingPassword.value = !_isChangingPassword.value;
//   }

//   final _isChangingUsername = false.obs;
//   bool get isChangingUsername => _isChangingUsername.value;
//   changeIsChangingUsername() {
//     //switches the value of isChangingUsername
//     _isChangingUsername.value = !_isChangingUsername.value;
//   }

//   final isLoading = false.obs;
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController currentpasswordController = TextEditingController();
//   TextEditingController newpasswordController = TextEditingController();
//   TextEditingController newpasswordagainController = TextEditingController();

//   String? tokenFromModel =
//       Get.find<LoginController>().loginModel.value.access_token;
//   String? emailFromModel =
//       Get.find<LoginController>().loginModel.value.data?.email;

// // ------------------ CHANGE USERNAME ------------------
//   Future<void> changeUsername(String userId) async {
//     var headers = {
//       'Authorization': 'Bearer: $tokenFromModel',
//       'Content-Type': 'application/json'
//     };

//     var requestUrl = '$baseUrl/api/users/$userId';

//     var requestData = {"name": usernameController.text};
//     if (usernameController.text.isEmpty) {
//       getSnackBar(
//           "Error", " sC.username_cannot_be_empty", Colors.red, Colors.black);
//     }

//     try {
//       isLoading.value = true;
//       http.Response response = await http.put(
//         Uri.parse(requestUrl),
//         headers: headers,
//         body: json.encode(requestData),
//       );
//       isLoading.value = false;
//       if (response.statusCode >= 200 && response.statusCode < 300) {
//         // refresh the login model
//         Get.find<LoginController>().fetchdata();
//         _isChangingUsername.value = false;
//       } else {
//         print(response.statusCode);
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Hata',
//         'Bir hata oluştu: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }

//   Future<void> changePassword(String userId) async {
//     var headers = {
//       'Authorization': 'Bearer: $tokenFromModel',
//       'Content-Type': 'application/json'
//     };

//     var requestUrl = '$baseUrl/api/auth/$userId/update';

//     var requestData = {
//       "email": emailFromModel,
//       "currentPassword": currentpasswordController.text,
//       "newPassword": newpasswordController.text
//     };

//     if (newpasswordController.text.isEmpty ||
//         newpasswordagainController.text.isEmpty ||
//         currentpasswordController.text.isEmpty) {
//       Get.snackbar("Error", "Fields cannot be empty",
//           backgroundColor: Colors.red, colorText: Colors.black);
//     } else if (newpasswordController.text != newpasswordagainController.text) {
//       Get.snackbar("Error", "Passwords do not match",
//           backgroundColor: Colors.red, colorText: Colors.black);
//     } else if (newpasswordController.text.length < 6) {
//       Get.snackbar("Error", "Password must be at least 6 characters",
//           backgroundColor: Colors.red, colorText: Colors.black);
//     } else if (currentpasswordController.text == newpasswordController.text) {
//       Get.snackbar("Error", "New password cannot be the same as old password",
//           backgroundColor: Colors.red, colorText: Colors.black);
//     } else {
//       try {
//         isLoading.value = true;
//         http.Response response = await http.put(
//           Uri.parse(requestUrl),
//           headers: headers,
//           body: json.encode(requestData),
//         );
//         isLoading.value = false;
//         if (response.statusCode >= 200 && response.statusCode < 300) {
//           getSnackBar("Success", response.body, Colors.green, Colors.white);
//           // refresh the login model
//           Get.find<LoginController>().fetchdata();
//           _isChangingPassword.value = false;
//           // clear the text fields

//           currentpasswordController.clear();
//           newpasswordController.clear();
//           newpasswordagainController.clear();
//         } else {
//           print(response.statusCode);

//           getSnackBar("Error", response.body, Colors.red, Colors.black);
//           print(response.body);
//         }
//       } catch (e) {
//         Get.snackbar(
//           'Hata',
//           'Bir hata oluştu: $e',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     }
//   }
// }

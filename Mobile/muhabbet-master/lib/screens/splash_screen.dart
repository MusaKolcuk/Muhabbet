import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    // Add any splash screen UI here
    // // For example, you can use an Image.asset widget

    // // Wait for some time (e.g., 3 seconds) and redirect
    Future.delayed(const Duration(seconds: 1), () {
      // Determine the route to navigate based on user authentication status
      // Replace `AuthService` with your own authentication service class
      // final isLoggedIn = loginController.isLoggedIn();

      // if (isLoggedIn) {
      //   // User is already logged in, navigate to the dashboard
      //   Get.offAllNamed('/home');
      // } else {
      //   // User is not logged in, navigate to the login screen
      Get.offAllNamed('/login');
      // }
    });

    return Scaffold(
        backgroundColor: Colors.white, // Customize the background color
        body: Center(
          child: Image.asset(
            app_logo,
            width: 200,
            height: 200,
          ),
        ) // Customize the splash screen UI
        );
  }
}

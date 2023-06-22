import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/screens/chat_screen.dart';
import 'package:muhabbet/screens/register_validation.dart';
import 'package:muhabbet/utils/theme_data.dart';
import 'constants.dart';
import 'screens/account_screen.dart';
import 'screens/contacts_list.dart';
import 'screens/forgot_password.dart';
import 'screens/help_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/new_contact_screen.dart';
import 'screens/privacy_policy_page_screen.dart';
import 'screens/register_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/terms_of_use_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      // initialRoute: '/register_validation',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen(),
        '/register_validation': (context) => const RegisterValidation(),
        '/home': (context) => HomeScreen(),
        '/contact_list': (context) => ContactsList(),
        '/chat_screen': (context) => ChatScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/account_screen': (context) => AccountScreen(),
        '/help_screen': (context) => const HelpScreen(),
        '/privacy_policy': (context) => const PrivacyPolicyPage(),
        '/terms_of_use': (context) => const TermsOfUseScreen(),
        '/new_contact': (context) => NewContactScreen(),
      },
      title: appName,
    );
  }
}

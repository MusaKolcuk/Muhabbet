import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/login_controller.dart';

class AccountScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());
  AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
        ),
        body: Column(
          children: [
            //TODO: 2fa
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text('2FA'),
              subtitle: Text('Enable or disable 2FA'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            // delete my account
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete my account'),
                          content: const Text(
                              'Are you sure you want to delete your account?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  // delete account
                                  loginController.deleteUser();
                                },
                                child: const Text('Delete'))
                          ],
                        ));
              },
              leading: const Icon(Icons.delete),
              title: const Text('Delete my account'),
              subtitle: const Text('Delete my account'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ));
  }
}

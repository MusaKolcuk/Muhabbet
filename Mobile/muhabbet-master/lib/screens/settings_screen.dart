import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';
import '../controller/all_controller.dart';
import '../controller/login_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    // SettingsController settingsController = Get.put(SettingsController());
    AllController allController = Get.put(AllController());
    LoginController loginController = Get.put(LoginController());
    GetStorage box = GetStorage();
    return Scaffold(
      appBar: AppBar(
        title: const Text(settings),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Obx(
          () => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        // settingsController.changeIsChangingUsername();
                      },
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text(username),
                        subtitle: Text(
                            loginController.loginModel.value.data?.name ??
                                "loading..."),
                        trailing:
                            // settingsController.isChangingUsername
                            //     ? const Icon(Icons.keyboard_arrow_up)
                            // :
                            const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  GestureDetector(
                    //account screen
                    child: ListTile(
                      leading: const Icon(Icons.key_sharp),
                      title: const Text(account),
                      subtitle: const Text("2FA , Delete my account"),
                      onTap: () {
                        Get.toNamed("/account_screen");
                      },
                    ),
                  ),
                  GestureDetector(
                    //help tile
                    child: ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text(help),
                      subtitle: const Text(
                          "Give Feedback , Privacy Policy , Terms of Use"),
                      onTap: () {
                        Get.toNamed("/help_screen");
                      },
                    ),
                  )
                  // if (settingsController.isChangingUsername) ...[
                  //   TextField(
                  //     controller: settingsController.usernameController,
                  //     decoration:
                  //         const InputDecoration(labelText: new_username),
                  //   ),
                  //   const SizedBox(height: 16.0),
                  //   ElevatedButton(
                  //     onPressed: settingsController.isLoading.value
                  //         ? null
                  //         : () {
                  //             // Şifre değiştirme işlemleri burada gerçekleştirilebilir
                  //             settingsController.changeUsername(
                  //                 loginController.loginModel.value.data?.id ??
                  //                     "");
                  //           },
                  //     child: Text(sC.update),
                  //   ),
                  // ],
                  ,
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text(emailText),
                    subtitle: Text(
                        loginController.loginModel.value.data?.email ??
                            "laoding..."),
                  ),
                  GestureDetector(
                    onTap: () {
                      // settingsController.changeIsChangingPassword();
                    },
                    child: const ListTile(
                      leading: Icon(Icons.lock),
                      title: Text(changePassword),
                      trailing:
                          // settingsController.isChangingPassword
                          //     ? const Icon(Icons.keyboard_arrow_up)
                          // : ,
                          Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  // if (settingsController.isChangingPassword) ...[
                  //   TextFormField(
                  //     controller: settingsController.currentpasswordController,
                  //     decoration:
                  //         const InputDecoration(labelText: currentPassword),
                  //   ),
                  //   const SizedBox(
                  //     height: 10.0,
                  //   ),
                  //   TextFormField(
                  //     controller: settingsController.newpasswordController,
                  //     decoration: const InputDecoration(labelText: newPassword),
                  //   ),
                  //   const SizedBox(
                  //     height: 10.0,
                  //   ),
                  //   TextFormField(
                  //     controller: settingsController.newpasswordagainController,
                  //     decoration:
                  //         const InputDecoration(labelText: newPassAgain),
                  //   ),
                  //   const SizedBox(height: 16.0),
                  //   ElevatedButton(
                  //     onPressed: () =>
                  //         // Şifre değiştirme işlemleri buradaa gerçekleştirilebilir
                  //         settingsController.isLoading == false
                  //             ? settingsController.changePassword(
                  //                 loginController.loginModel.value.data?.id ??
                  //                     "")
                  //             : null,
                  //     child: const Text(change),
                  //   ),
                  // ],

                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text(
                      language,
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      // showLanguageBottomSheet(context);
                    },
                  ),
                  ListTile(
                      title: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.purple,
                        size: 30,
                      ),
                      const SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () async {
                          box.remove('token');
                          await clearAllData();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          sign_out,
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  )),
                  // const Center(child: Text(publisher)),
                  //   if (kDebugMode) ...[
                  //     Container(
                  //       color: Colors.red,
                  //       child: Column(children: [
                  //         const Text("DEBUG MODE"),

                  //         //id listtile
                  //         ListTile(
                  //           leading: const Icon(Icons.info),
                  //           title: Text(
                  //               loginController.loginModel.value.data?.id ??
                  //                   "loading..."),
                  //         ),
                  //         ListTile(
                  //           leading: const Icon(Icons.info),
                  //           title: Text(loginController
                  //                   .loginModel.value.access_token
                  //                   .toString() ??
                  //               "loading token"),
                  //         ),
                  //         // store token
                  //         ListTile(
                  //           leading: const Icon(Icons.info),
                  //           title: Text(box.read('token') ?? "loading token"),
                  //         ),
                  //         const Text("DEBUG MODE"),
                  //       ]),
                  //     )
                  //   ],
                ],
              )),
        )),
      ),
    );
  }
}

clearAllData() async {
  await Get.deleteAll();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/login_controller.dart';
import 'package:muhabbet/controller/new_contact_controller.dart';
import 'package:muhabbet/screens/chat_screen.dart';
import 'package:muhabbet/utils/theme_data.dart';
import 'package:share_plus/share_plus.dart';

class ContactsList extends StatelessWidget {
  ContactsList({super.key});
  NewContactController newContactController = Get.put(NewContactController());
  void shareMessage() {
    LoginController loginController = Get.put(LoginController());

    String id = loginController.loginModel.value.data!.id.toString();
    Share.share(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Row(
              children: [
                Text('Choose Contact'),
              ],
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    '${newContactController.contactModel.value.data?.length ?? 0} contacts',
                    style: const TextStyle(fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Obx(() => Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            ListTile(
                              onTap: () => Navigator.pop(context),
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 20,
                                child: const Icon(
                                  Icons.group_add_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              title: const Text('New Group'),
                            ),
                            ListTile(
                              onTap: () => Get.toNamed("/new_contact"),
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 20,
                                child: const Icon(
                                  Icons.person_add_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              title: const Text('New Contact'),
                            ),
                            ListTile(
                              onTap: () {
                                shareMessage();
                              },
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 20,
                                child: const Icon(
                                  Icons.share_outlined,
                                  color: Colors.black,
                                ),
                              ),
                              title: const Text('Invite Friends'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    newContactController.contactModel.value.data?.isEmpty ??
                            true
                        ? const Center(child: Text('No Contacts'))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: newContactController
                                    .contactModel.value.data?.length ??
                                0,
                            itemBuilder: (context, index) {
                              //add 3 listtile to listview
                              return contactTile(index);
                            }),
                  ],
                ),
              )))
        ],
      )),
    );
  }

  GestureDetector contactTile(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            Get.context!,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                    id: newContactController
                        .contactModel.value.data?[index]?.Id)));
      },
      child: ListTile(
        // whatsapp clone
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 30,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network("https://picsum.photos/id/237/200/300")),
        ),
        title: Obx(
          () => Text(
              newContactController.contactModel.value.data?[index]?.name ??
                  'No Name'),
        ),
        subtitle: Obx(
          () => Text(newContactController.contactModel.value.data?[index]?.Id ??
              'No Id'),
        ),
        trailing: index % 4 == 0
            ? const Icon(
                Icons.lock_outlined,
                color: Colors.red,
              )
            : null,
      ),
    );
  }
}

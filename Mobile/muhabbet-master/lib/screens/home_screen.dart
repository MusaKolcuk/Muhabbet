//home screen
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/new_contact_controller.dart';

import '../constants.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  NewContactController newContactController = Get.put(NewContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newContactController.fetchContact();
          Get.toNamed("/contact_list");
        },
        child: const Icon(Icons.message_outlined),
      ),
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == create_group) {
                // goCreateGroupScreen();
              } else if (value == join_group) {
                // goJoinGroupScreen();
              } else if (value == settings) {
                Get.toNamed("/settings");
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                popUpItem(create_group),
                popUpItem(join_group),
                popUpItem(settings)
              ];
            },
          )
        ],
        title: const Text('Muhabbet', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                // newContactController.contactModel.value.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var name = faker.person.name();
                  var image = faker.image.image();
                  var sentence = faker.lorem.sentence();
                  //add 3 listtile to listview
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          Get.context!,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(id: name)));
                    },
                    child: ListTile(
                      // whatsapp clone
                      leading: CircleAvatar(
                          radius: 30, backgroundImage: NetworkImage(image)),
                      title: Text(name),
                      subtitle: Text(sentence),

                      trailing: index % 4 == 0
                          ? const Icon(
                              Icons.lock_outlined,
                              color: Colors.red,
                            )
                          : null,
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}

PopupMenuItem<String> popUpItem(String value) {
  return PopupMenuItem<String>(
    value: value,
    child: Text(
      value,
    ),
  );
}

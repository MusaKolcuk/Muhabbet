import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/new_contact_controller.dart';

class NewContactScreen extends StatelessWidget {
  NewContactScreen({super.key});

  NewContactController newContactController = Get.put(NewContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: newContactController.nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'User Id:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: newContactController.contactIdController,
              decoration: const InputDecoration(
                hintText: 'Enter contact id',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Perform save operation
                //TODO: Add save operation
                newContactController.saveContact();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help'),
        ),
        body: Column(
          children: [
            // "Give Feedback , Privacy Policy , Terms of Use"

            // give feedback
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.feedback),
              title: const Text('Give Feedback'),
              subtitle: const Text('Give Feedback'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            // privacy policy
            ListTile(
              onTap: () {
                Get.toNamed("/privacy_policy");
              },
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              subtitle: const Text('Privacy Policy'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            // terms of use
            ListTile(
              onTap: () {
                Get.toNamed("/terms_of_use");
              },
              leading: const Icon(Icons.description),
              title: const Text('Terms of Use'),
              subtitle: const Text('Terms of Use'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ));
  }
}

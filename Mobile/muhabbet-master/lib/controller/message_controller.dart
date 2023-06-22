import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/message_model.dart';

class MessageController extends GetxController {
  final TextEditingController messageInputController = TextEditingController();
  List<MessageModel> messages = <MessageModel>[].obs;

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    messages.add(messageModel);
  }
}

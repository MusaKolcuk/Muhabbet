// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhabbet/controller/login_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/message_model.dart';

class ChatScreen extends StatefulWidget {
  String? id;
  ChatScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  LoginController loginController = Get.put(LoginController());
  final TextEditingController _messageInputController = TextEditingController();
  List<MessageModel> messages = [];

  late IO.Socket socket;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
  }

  void connect() {
    socket = IO.io("http://172.2.1.112:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
      });
    });
    print(socket.connected);
    print(widget.id);
    socket.emit("signin", widget.id);
  }

  void sendMessage(String message, String sourceId, String targetId) {
    setMessage("source", message);
    if (_messageInputController.text.isNotEmpty) {
      socket.emit("message", {
        "message": message,
        "sourceId": sourceId,
        "targetId": targetId,
      });
      _messageInputController.clear();
    }
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);

    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //flutter chat screen
        appBar: AppBar(
          title: Text(widget.id ?? ""),
          actions: [
            IconButton(
              onPressed: () {
                // _sendMessage();
                // _messageInputController.clear();
              },
              icon: const Icon(Icons.video_call_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messages[index].type == "source"
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  messages[index].message ?? "",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                messages[index].message ?? "",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      onSubmitted: (value) {
                        sendMessage(_messageInputController.text, widget.id!,
                            loginController.loginModel.value.data?.id ?? "");
                        _messageInputController.clear();
                      },
                      controller: _messageInputController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'Type a message',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_messageInputController.text, widget.id!,
                        loginController.loginModel.value.data?.id ?? "");
                    _messageInputController.clear();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ));
  }
}

import 'package:chatgpttry/constants/constants.dart';
import 'package:chatgpttry/services/api_services.dart';
import 'package:chatgpttry/services/assets_manager.dart';
import 'package:chatgpttry/services/services.dart';
import 'package:chatgpttry/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController texteditingcontroller = TextEditingController();
  bool _isTyping = true;
  @override
  void initState() {
    texteditingcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    texteditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(AssetsManager.chatgpt),
            )),
        title: const Text('ChatGPT'),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModelSheet(context: context);
              },
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChatWidget(
                    msg: (chatMessages[index]['msg']).toString(),
                    index: int.parse(
                      chatMessages[index]['chatIndex'].toString(),
                    ),
                  );
                },
              ),
            ),
            // _isTyping? const Text("Typing..."):const Text("Not Typing"),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.amber,
                size: 20.0,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          onSubmitted: (value) {},
                          controller: texteditingcontroller,
                          decoration: const InputDecoration(
                            hintText: "How Can I Help You?",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            try {
                              await ApiServices.getModels();
                            } catch (error) {
                              print(error);
                            }
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

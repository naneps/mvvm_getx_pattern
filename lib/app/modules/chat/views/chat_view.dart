import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx_pattern/app/modules/chat/controllers/chat_controller.dart';
import 'package:mvvm_getx_pattern/app/modules/chat/models/message.model.dart';
import 'package:mvvm_getx_pattern/app/modules/chat/widgets/bubble_chat_wiidget.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    // Sample messages
    final messages = List.generate(
      100,
      (index) => MessageModel(
        content:
            'Message $index pppojkspo dapodk aspodk apodk pasdk p as;dlk a;lsdk ;aslkd ;saldk ;asldk ;asldk  ;asldk a;ldk a;sldk sa;ldk ;asldk ;saoskd p',
        isSentByMe: index % 2 == 0,
        timestamp: DateTime.now().subtract(Duration(minutes: index * 5)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anonymous Chat'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // controller.signOut();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return BubbleChatWidget(message: message);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: bottomInset > 0 ? 0 : 20,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () {
                        // controller.pickImage();
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                        minLines: 1,
                        maxLines: 5,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        // controller.sendMessage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

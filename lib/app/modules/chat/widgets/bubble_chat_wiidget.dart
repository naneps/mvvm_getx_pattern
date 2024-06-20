import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_getx_pattern/app/modules/chat/models/message.model.dart';

class BubbleChatWidget extends StatelessWidget {
  final MessageModel message;

  const BubbleChatWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    // Define the color based on who sent the message
    final backgroundColor =
        message.isSentByMe ? Theme.of(context).primaryColor : Colors.grey[300];

    // Define the text color based on who sent the message
    final textColor = message.isSentByMe ? Colors.white : Colors.black87;

    // Define the border radius based on who sent the message
    final borderRadius = BorderRadius.only(
      topLeft: message.isSentByMe ? Radius.zero : const Radius.circular(10),
      topRight: message.isSentByMe ? const Radius.circular(20) : Radius.zero,
      bottomLeft: message.isSentByMe ? const Radius.circular(20) : Radius.zero,
      bottomRight: message.isSentByMe ? Radius.zero : const Radius.circular(10),
    );

    // Define the alignment based on who sent the message
    final alignment =
        message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft;

    // Define the cross axis alignment based on who sent the message
    final crossAxisAlignment =
        message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
            child: Text(message.content,
                style: Get.textTheme.bodyMedium!.copyWith(color: textColor)),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('hh:mm a').format(message.timestamp),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

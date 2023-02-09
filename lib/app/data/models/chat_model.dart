import 'package:chatgpt_flutter/app/domain/entities/chat.dart';

class ChatModel extends Chat {
  ChatModel({
    required super.msg,
    required super.chatIndex,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      msg: json['msg'],
      chatIndex: json['chatIndex'],
    );
  }
}

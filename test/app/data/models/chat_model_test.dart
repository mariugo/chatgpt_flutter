import 'package:chatgpt_flutter/app/data/models/chat_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final json = {
    'msg': 'msg',
    'chatIndex': 1,
  };

  final chatModelMock = ChatModel.fromJson(json);

  test('Should return instance of ChatModel', () {
    expect(chatModelMock, isA<ChatModel>());
  });

  test('Should return 1 as chatIndex', () {
    expect(chatModelMock.chatIndex, 1);
  });
}

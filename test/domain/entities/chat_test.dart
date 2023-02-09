import 'package:chatgpt_flutter/app/domain/entities/chat.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final chatMock = Chat(
    msg: 'How are you?',
    chatIndex: 1,
  );

  test('Should return instance of Chat', () {
    expect(chatMock, isA<Chat>());
  });

  test('Should return How are you? as msg', () {
    expect(chatMock.msg, 'How are you?');
  });
}

import 'package:chatgpt_flutter/app/data/models/chat_model.dart';
import 'package:chatgpt_flutter/app/data/models/models_model.dart';
import 'package:chatgpt_flutter/app/data/repository/api_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final getModels = ApiServiceImpl().getModels();
  final sendMessage =
      ApiServiceImpl().sendMessage(message: 'How are you?', modelId: '1');

  test('Should return a List of ModelsModel', () async {
    expect(getModels, isA<Future<List<ModelsModel>>>());
  });

  test('Should return a List of ChatModel', () async {
    expect(sendMessage, isA<Future<List<ChatModel>>>());
  });
}

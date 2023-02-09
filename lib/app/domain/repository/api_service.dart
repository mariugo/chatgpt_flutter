import 'package:chatgpt_flutter/app/data/models/chat_model.dart';
import 'package:chatgpt_flutter/app/data/models/models_model.dart';

abstract class ApiService {
  Future<List<ModelsModel>> getModels();
  Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId});
}

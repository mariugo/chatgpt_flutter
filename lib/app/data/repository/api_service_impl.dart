import 'dart:convert';
import 'dart:io';

import 'package:chatgpt_flutter/app/data/models/models_model.dart';
import 'package:chatgpt_flutter/app/data/models/chat_model.dart';
import 'package:chatgpt_flutter/app/domain/repository/api_service.dart';
import 'package:chatgpt_flutter/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiServiceImpl implements ApiService {
  @override
  Future<List<ModelsModel>> getModels() async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/models',
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      final json = jsonDecode(response.body);

      if (json['error'] != null) {
        throw HttpException(json['error']['message']);
      }

      final List models = [];
      for (var model in json['data']) {
        models.add(model);
      }
      return ModelsModel.modelsFromSnapshot(models);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      final response = await http.post(
        Uri.parse(
          '$baseUrl/completions',
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'prompt': message,
            'model': modelId,
          },
        ),
      );

      Map json = jsonDecode(response.body);

      if (json['error'] != null) {
        throw HttpException(json['error']['message']);
      }

      List<ChatModel> chatList = [];
      if (json['choices'].lenght > 0) {
        chatList = List.generate(
          json['choices'].length,
          (index) => ChatModel(
            msg: json['choices'][index]['text'],
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (error) {
      throw Exception(error);
    }
  }
}

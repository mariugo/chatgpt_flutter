import 'package:chatgpt_flutter/app/domain/entities/models.dart';

class ModelsModel extends Models {
  ModelsModel({
    required super.id,
    required super.created,
    required super.root,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) {
    return ModelsModel(
      id: json['id'],
      created: json['created'],
      root: json['root'],
    );
  }

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) =>
      modelSnapshot.map((model) => ModelsModel.fromJson(model)).toList();
}

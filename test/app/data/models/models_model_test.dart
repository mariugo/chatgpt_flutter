import 'package:chatgpt_flutter/app/data/models/models_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final json = {
    'id': 'msg',
    'created': 1,
    'root': '1',
  };

  final modelsModelMock = ModelsModel.fromJson(json);

  test('Should return instance of ModelsModel', () {
    expect(modelsModelMock, isA<ModelsModel>());
  });

  test('Should return 1 as created', () {
    expect(modelsModelMock.created, 1);
  });
}

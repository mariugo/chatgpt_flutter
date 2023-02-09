import 'package:chatgpt_flutter/app/domain/entities/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final modelsMock = Models(
    id: '1',
    created: 1,
    root: 'root',
  );

  test('Should return instance of Models', () {
    expect(modelsMock, isA<Models>());
  });

  test('Should return 1 as id', () {
    expect(modelsMock.id, '1');
  });
}

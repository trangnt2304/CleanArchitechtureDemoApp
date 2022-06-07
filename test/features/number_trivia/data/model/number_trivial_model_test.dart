import 'package:clean_architecture_demo_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTrivialModel(number: 1, text: 'Test');

  test('Should be a number trivia Entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });
  group('fromJson', () {
    test('return valid model when json model is int', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      final result = NumberTrivialModel.fromJson(jsonMap);
      expect(result, tNumberTriviaModel);
    });
  });
  test('return valid model when json model is double', () async {
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('trivia_double.json'));
    final result = NumberTrivialModel.fromJson(jsonMap);
    expect(result, tNumberTriviaModel);
  });

  group('toJson', () {
    test('return valid model when json model is int', () async {
      final result = tNumberTriviaModel.toJson();
      final expectedMap = {
        "text": "Test",
        "number": 1.0,
      };
      expect(result, expectedMap);
    });
  });
}

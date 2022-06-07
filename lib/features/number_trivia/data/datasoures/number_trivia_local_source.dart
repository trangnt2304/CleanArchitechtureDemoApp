import 'package:clean_architecture_demo_app/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTrivialLocalDataSource{
  Future <NumberTrivialModel>? getLastNumberTrivia();
  Future <void>? cacheNumberTrivia(NumberTrivialModel triviaToCache);
}
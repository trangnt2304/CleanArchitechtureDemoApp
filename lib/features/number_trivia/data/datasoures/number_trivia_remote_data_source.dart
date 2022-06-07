 import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTrivialRemoteDataSource{
   Future <NumberTrivia>? getConcreteNumberTrivia(int number);
   Future <NumberTrivia>? getRandomNumberTrivia();
 }
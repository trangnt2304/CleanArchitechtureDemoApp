import 'package:clean_architecture_demo_app/core/error/failures.dart';
import 'package:clean_architecture_demo_app/core/usecases/usecase.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/repositories/numver_trivia_respository.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia,NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);
  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }

}


import 'package:clean_architecture_demo_app/core/error/failures.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type,Params>{
  Future <Either<Failure,NumberTrivia>?> call(Params params);
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => throw UnimplementedError();
}
import 'package:clean_architecture_demo_app/core/error/failures.dart';
import 'package:clean_architecture_demo_app/core/platform/network_info.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/datasoures/number_trivia_local_source.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/datasoures/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/repositories/numver_trivia_respository.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepoImplementation implements NumberTriviaRepository{
  final NumberTrivialRemoteDataSource numberTrivialRemoteDataSource;
  final NumberTrivialLocalDataSource numberTrivialLocalDataSource;
  final NetworkInfor networkInfor;

  NumberTriviaRepoImplementation(
      {required this.numberTrivialRemoteDataSource,
      required this.numberTrivialLocalDataSource,
      required this.networkInfor});


  @override
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number) async {
    networkInfor.isConnected;
    return Right(await numberTrivialRemoteDataSource.getConcreteNumberTrivia(number) ?? NumberTrivia(text: '', number: 0));
  }

  @override
  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia() {
    throw UnimplementedError();
  }

}

import 'package:clean_architecture_demo_app/core/platform/network_info.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/datasoures/number_trivia_local_source.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/datasoures/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/data/repositories/number_trivial_repository_implement.dart';
import 'package:clean_architecture_demo_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'number_trivia_repositoru_impl_test.mocks.dart';

@GenerateMocks([NumberTrivialRemoteDataSource])
@GenerateMocks([NumberTrivialLocalDataSource])
@GenerateMocks([NetworkInfor])
void main() {
  late NumberTriviaRepoImplementation repoImplementation;
  late MockNumberTrivialRemoteDataSource numberTrivialRemoteDataSource;
  late MockNumberTrivialLocalDataSource numberTrivialLocalDataSource;
  late MockNetworkInfor mockNetworkInfor;
  setUp(() {
    mockNetworkInfor = MockNetworkInfor();
    numberTrivialLocalDataSource = MockNumberTrivialLocalDataSource();
    numberTrivialRemoteDataSource = MockNumberTrivialRemoteDataSource();
    repoImplementation = NumberTriviaRepoImplementation(
      numberTrivialLocalDataSource: numberTrivialLocalDataSource,
      numberTrivialRemoteDataSource: numberTrivialRemoteDataSource,
      networkInfor: mockNetworkInfor,
    );
  });
  group('getConcreteNumberTrivia', (){
    final tNumber = 1;
    final tNumberTriviaModel = NumberTrivialModel(text: 'text', number: tNumber);
    final NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test('should check if device is online',() async{
      when(mockNetworkInfor.isConnected).thenAnswer((_)async => true);
      repoImplementation.getConcreteNumberTrivia(tNumber);
      verify(mockNetworkInfor.isConnected);
    });
    test('Check if device is offline',() async{
      when(mockNetworkInfor.isConnected).thenAnswer((_)async => false);
      repoImplementation.getConcreteNumberTrivia(tNumber);
      verify(mockNetworkInfor.isConnected);
    });
    group('device is online', (){
      setUp((){
        when(mockNetworkInfor.isConnected).thenAnswer((_) async => true);
      });
      test('should return remote data when the call to remote data source is successfull', () async{
        when(numberTrivialRemoteDataSource.getConcreteNumberTrivia(any)).thenAnswer((_)async => tNumberTriviaModel);
        final result = repoImplementation.getConcreteNumberTrivia(tNumber);
        verify(numberTrivialRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, Right(tNumberTrivia));
      });

    });
    group('device is offline', (){
      setUp((){
        when(mockNetworkInfor.isConnected).thenAnswer((_) async => false);
      });

    });
  });

}

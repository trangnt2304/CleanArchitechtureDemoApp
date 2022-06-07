 import 'package:equatable/equatable.dart';

 class Failure extends Equatable{
  Failure() : super();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//general fail
 class ServerFail extends Failure{

 }

 class CacheFail extends Failure{}
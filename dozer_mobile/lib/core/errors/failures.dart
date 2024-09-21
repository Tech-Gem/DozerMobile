//generate abstract failure class that extends equatable
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  final String message;

  const Failure(this.message, [this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [message, properties];
}

//generate failure clases
class ServerFailure extends Failure {
  @override
  final String message;

  const ServerFailure({required this.message}) : super(message);
}

class CacheFailure extends Failure {
  @override
  final String message;

  const CacheFailure({required this.message}) : super(message);
}

class NetworkFailure extends Failure {
  @override
  final String message;

  const NetworkFailure({required this.message}) : super(message);
}

class UnauthenticatedFailure extends Failure {
  @override
  final String message;

  const UnauthenticatedFailure({required this.message}) : super(message);
}

class UnauthorisedFailure extends Failure {
  @override
  final String message;

  const UnauthorisedFailure({required this.message}) : super(message);
}

class DatabaseFailure extends Failure{
   @override
  final String message;
  DatabaseFailure({required this.message}) : super(message);


}

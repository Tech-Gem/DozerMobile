import 'package:dartz/dartz.dart';
import 'package:dozer_mobile/core/error/failure.dart';
import 'package:equatable/equatable.dart';


abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

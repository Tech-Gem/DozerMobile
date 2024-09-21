import 'package:dartz/dartz.dart';
import 'package:dozer_mobile/core/errors/failures.dart';
import 'package:dozer_mobile/core/use_case/use_case.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/entities/search_assistant_response.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/repository/search_assistant_repo.dart';
import 'package:equatable/equatable.dart';

class SearchAssistantUseCase
    implements UseCase<SearchAssistantResponse, Params> {
  final SearchAssistantRepository repository;

  SearchAssistantUseCase(this.repository);

  @override
  Future<Either<Failure, SearchAssistantResponse>> call(Params params) async {
    return await repository.sendMessage(params.message);
  }
}

class Params extends Equatable {
  final String message;

  Params({required this.message});

  @override
  List<Object> get props => [message];
}

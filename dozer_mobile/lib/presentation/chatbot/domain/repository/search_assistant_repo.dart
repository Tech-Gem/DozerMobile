import 'package:dartz/dartz.dart';
import 'package:dozer_mobile/core/errors/failures.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/entities/search_assistant_response.dart';

abstract class SearchAssistantRepository {
  Future<Either<Failure, SearchAssistantResponse>> sendMessage(String message);
}

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/core/data/network/network_info.dart';
import 'package:dozer_mobile/core/errors/failures.dart';
import 'package:dozer_mobile/presentation/chatbot/data/datasource/search_assistant_datasource.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/entities/search_assistant_response.dart';
import 'package:dozer_mobile/presentation/chatbot/domain/repository/search_assistant_repo.dart';

class SearchAssistantRepositoryImpl implements SearchAssistantRepository {
  final SearchAssistantDataSource dataSource;
  NetworkInfo networkInfo = NetworkInfo(Connectivity());

  SearchAssistantRepositoryImpl(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, SearchAssistantResponse>> sendMessage(
      String message) async {
    try {
      if (await networkInfo.isConnected()) {
        final response = await dataSource.sendMessage(message);
        return Right(response);
      } else {
        return const Left(NetworkFailure(message: "No Internet Connection"));
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

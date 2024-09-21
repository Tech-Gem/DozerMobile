import 'dart:convert';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/presentation/chatbot/data/modles/search_assistant_model.dart';
import 'package:http/http.dart' as http;

abstract class SearchAssistantDataSource {
  Future<SearchAssistantResponseModel> sendMessage(String message);
}

class SearchAssistantDataSourceImpl implements SearchAssistantDataSource {
  final http.Client client;

  SearchAssistantDataSourceImpl({required this.client});

  @override
  Future<SearchAssistantResponseModel> sendMessage(String message) async {
    try {
      final response = await client.post(
        Uri.parse('https://bazar-chatbot.onrender.com/chat'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "cookieId": "12w3hj4",
          "message": message,
        }),
      );

      if (response.statusCode == 200) {
        final responseModel =
            SearchAssistantResponseModel.fromJson(jsonDecode(response.body));
        return responseModel;
      } else {
        throw ServerException('Failed to load search results');
      }
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

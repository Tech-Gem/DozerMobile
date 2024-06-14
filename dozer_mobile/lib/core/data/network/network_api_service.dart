import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dozer_mobile/core/data/apis/base_api_service.dart';
import 'package:dozer_mobile/core/data/network/api_exceptions.dart';
import 'package:dozer_mobile/core/utils/get_storage_helper.dart';
import 'package:dozer_mobile/core/utils/logger.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      GetStorageHelper.addValue("token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkzOGQyNjdiLWFmNzQtNDE0OS1hMWI0LWFkOGJkODlhMjQ1MiIsImlhdCI6MTcxODM4NDIxNywiZXhwIjoxNzI2MTYwMjE3fQ.k83UOWogl88MOKSr1rcPKpM5bFBWR9BRcOd69lExv1c");
      print(GetStorageHelper.getValue("token"));
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue("token") ?? ""}",
          
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      print("hello");
      print(jsonBody);
      GetStorageHelper.addValue("token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImIwODIxZTVjLTg5NWYtNDAzZi04M2E1LTc3NTgzNjU0NDdlOSIsImlhdCI6MTcxODM4OTg4MCwiZXhwIjoxNzI2MTY1ODgwfQ.-TO3QRX1qQIlMcRN7lsrwaRC7wiuL87q9gNXx6VOfDs");
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> putResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> patchResponse(
    String url,
    Map<String, dynamic> jsonBody,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> deleteResponse(
    String url,
  ) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization':
              "Bearer ${GetStorageHelper.getValue(GetStorageKeys.keyToken) ?? ""}",
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Please Try Again..');
        },
      );
      Logger.log('STATUS CODE: ${response.statusCode}');
      Logger.log('RESPONSE BODY: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('');
    } on RequestTimeoutException {
      throw RequestTimeoutException('');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        final dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        final dynamic responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException('Please Check Again..');
      case 401:
        throw UnauthorizedException(
          (jsonDecode(response.body) as Map<String, dynamic>)['detail']
              as String,
        );
      case 403:
        throw UnauthorisedRequestException('Please Try Again..');
      case 404:
        throw UnauthorisedRequestException('Please Try Again..');
      case 500:
        throw ServerException('Error occurred while communication with server');
      default:
        throw DefaultException(
          (jsonDecode(response.body) as Map<String, dynamic>)['detail']
              .toString(),
        );
    }
  }
  
  jsonEncode(Map<String, dynamic> jsonBody) {}
}

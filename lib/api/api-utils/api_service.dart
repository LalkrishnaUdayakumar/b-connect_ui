import 'dart:convert';
import 'package:b_connect/api/api-utils/api_config.dart';
import 'package:b_connect/token.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

enum HttpMethod { get, post, put, patch, delete }

class ApiService {
  static Future<T?> apiCall<T, R>({
    required String endpoint,
    required String apiName,
    required HttpMethod method,
    R? request,
    required T Function(Map<String, dynamic>) responseFromMap,
    Map<String, String>? queryParams,
  }) async {
    Uri url = Uri.parse('${ApiConfig.baseUrl}$endpoint');

    if (queryParams != null && queryParams.isNotEmpty) {
      url = url.replace(queryParameters: queryParams);
    }

    debugPrint(
      '[$apiName] Sending ${method.name.toUpperCase()} request to: $url',
    );

    try {
      final token = await TokenStorage.getToken();

      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      };

      String? requestBody;
      if (request != null &&
          (method != HttpMethod.get && method != HttpMethod.delete)) {
        final requestJson = (request as dynamic).toJson();
        requestBody = jsonEncode(requestJson);
        debugPrint('Request body: $requestBody');
      }

      http.Response response;

      switch (method) {
        case HttpMethod.get:
          response = await http.get(
            url,
            headers: headers,
          );
          break;

        case HttpMethod.post:
          response = await http.post(
            url,
            headers: headers,
            body: requestBody,
          );
          break;

        case HttpMethod.put:
          response = await http.put(
            url,
            headers: headers,
            body: requestBody,
          );
          break;

        case HttpMethod.patch:
          response = await http.patch(
            url,
            headers: headers,
            body: requestBody,
          );
          break;

        case HttpMethod.delete:
          response = await http.delete(
            url,
            headers: headers,
          );
          break;
      }

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Raw response body: ${response.body}');

      if (_isSuccessfulResponse(response.statusCode)) {
        String responseBody = utf8.decode(response.bodyBytes);
        Map<String, dynamic> jsonMap = jsonDecode(responseBody);
        T resp = responseFromMap(jsonMap);
        return resp;
      } else {
        debugPrint('Failed to $apiName. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } on http.ClientException catch (e) {
      debugPrint('Unable to Connect to Server. Error: ${e.toString()}');
    } catch (e) {
      debugPrint('An unexpected error occurred: ${e.toString()}');
    }

    return null;
  }

  static bool _isSuccessfulResponse(int statusCode) {
    return statusCode >= 200 && statusCode < 300 || statusCode == 400;
  }
}

// How to use in your Flutter app:
// void main() async {
//   await ApiUsageExample.demonstrateApiCalls();
// }
/*
// The simplified method automatically:
1. Calls request.toJson() to get Map<String, dynamic>
2. Converts it to JSON string using jsonEncode()
3. Sends HTTP request
4. Receives response and decodes to Map<String, dynamic>
5. Calls your responseFromMap function to create your response object

// For requests WITH body (POST, PUT, PATCH)
ApiService.apiCall<ResponseType, RequestType>(
  endpoint: '/your/endpoint',
  apiName: 'yourApiName',
  method: HttpMethod.post, // or put, patch
  request: yourRequestObject, // Must have toJson() method
  responseFromMap: (json) => ResponseType.fromJson(json),
);

// For requests WITHOUT body (GET, DELETE)
ApiService.apiCall<ResponseType, void>(
  endpoint: '/your/endpoint',
  apiName: 'yourApiName', 
  method: HttpMethod.get, // or delete
  request: null, // No request body
  responseFromMap: (json) => ResponseType.fromJson(json),
  queryParams: {'param': 'value'}, // Optional for GET
);

class UserApi {
  // POST - Create User
  static Future<UserResponse?> createUser(CreateUserRequest request) async {
    return await ApiService.apiCall<UserResponse, CreateUserRequest>(
      endpoint: '/user/create',
      apiName: 'createUser',
      method: HttpMethod.post,
      request: request,
      responseFromMap: (json) => UserResponse.fromJson(json),
    );
  }

  // GET - Get User by ID
  static Future<UserResponse?> getUser(String userId) async {
    return await ApiService.apiCall<UserResponse, void>(
      endpoint: '/user/$userId',
      apiName: 'getUser',
      method: HttpMethod.get,
      request: null,
      responseFromMap: (json) => UserResponse.fromJson(json),
    );
  }

  // GET - Search Users with query parameters
  static Future<UsersListResponse?> searchUsers({
    required String query,
    required int page,
    int pageSize = 10,
  }) async {
    return await ApiService.apiCall<UsersListResponse, void>(
      endpoint: '/user/search',
      apiName: 'searchUsers',
      method: HttpMethod.get,
      request: null,
      responseFromMap: (json) => UsersListResponse.fromJson(json),
      queryParams: {
        'query': query,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      },
    );
  }

  // PUT - Update User
  static Future<UserResponse?> updateUser(
    String userId,
    UpdateUserRequest request,
  ) async {
    return await ApiService.apiCall<UserResponse, UpdateUserRequest>(
      endpoint: '/user/$userId',
      apiName: 'updateUser',
      method: HttpMethod.put,
      request: request,
      responseFromMap: (json) => UserResponse.fromJson(json),
    );
  }

  // DELETE - Delete User
  static Future<SuccessResponse?> deleteUser(String userId) async {
    return await ApiService.apiCall<SuccessResponse, void>(
      endpoint: '/user/$userId',
      apiName: 'deleteUser',
      method: HttpMethod.delete,
      request: null,
      responseFromMap: (json) => SuccessResponse.fromJson(json),
    );
  }
}
*/

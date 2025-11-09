import 'package:b_connect/api/api_service.dart';
import 'package:b_connect/api/base_response.dart';
import 'package:b_connect/api/change_password/change_password_request.dart';

const String apiName = 'changePassword';
const String endpoint = '/changePassword';
const HttpMethod method = HttpMethod.post;

typedef Response = BaseResponse;
typedef Request = ChangePasswordRequest;

Future<Response?> changePassword(Request request) async {
  return await ApiService.apiCall<Response, Request>(
    endpoint: endpoint,
    apiName: apiName,
    method: method,
    request: request,
    responseFromMap: (json) => Response.fromJson(json),
  );
}

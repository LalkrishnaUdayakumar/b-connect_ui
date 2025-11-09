import 'package:b_connect/api/api_service.dart';
import 'package:b_connect/api/base_response.dart';
import 'package:b_connect/api/forget_password/forget_password_request.dart';

const String apiName = 'forgetPassword';
const String endpoint = '/forgetPassword';
const HttpMethod method = HttpMethod.post;

typedef Response = BaseResponse;
typedef Request = ForgetPasswordRequest;

Future<Response?> forgetPassword(Request request) async {
  return await ApiService.apiCall<Response, Request>(
    endpoint: endpoint,
    apiName: apiName,
    method: method,
    request: request,
    responseFromMap: (json) => Response.fromJson(json),
  );
}

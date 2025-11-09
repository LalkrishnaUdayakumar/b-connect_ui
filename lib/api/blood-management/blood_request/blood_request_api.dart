import 'package:b_connect/api/api-utils/api_service.dart';
import 'package:b_connect/api/blood-management/blood_request/blood_request_request.dart';
import 'package:b_connect/api/blood-management/blood_request/blood_request_response.dart';

const String apiName = 'bloodRequest';
const String endpoint = '/request/send';
const HttpMethod method = HttpMethod.post;

typedef Response = BloodRequestResponse;
typedef Request = BloodRequestRequest;

Future<Response?> bloodRequest(Request request) async {
  return await ApiService.apiCall<Response, Request>(
    endpoint: endpoint,
    apiName: apiName,
    method: method,
    request: request,
    responseFromMap: (json) => Response.fromJson(json),
  );
}

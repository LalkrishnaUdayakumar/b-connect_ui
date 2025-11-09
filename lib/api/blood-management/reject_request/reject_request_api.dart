import 'package:b_connect/api/api-utils/api_service.dart';
import 'package:b_connect/api/api-utils/base_response.dart';

const String apiName = 'rejectRequest';
const HttpMethod method = HttpMethod.put;

typedef Response = BaseResponse;

Future<Response?> rejectRequest(double reqId) async {
  return await ApiService.apiCall<Response, void>(
    endpoint: '/request/$reqId/reject',
    apiName: apiName,
    method: method,
    request: null,
    responseFromMap: (json) => Response.fromJson(json),
  );
}

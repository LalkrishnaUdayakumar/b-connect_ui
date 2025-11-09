import 'package:b_connect/api/api-utils/api_service.dart';
import 'package:b_connect/api/api-utils/base_response.dart';

const String apiName = 'approveRequest';
const HttpMethod method = HttpMethod.put;

typedef Response = BaseResponse;

Future<Response?> approveRequest(double reqId) async {
  return await ApiService.apiCall<Response, void>(
    endpoint: '/request/$reqId/approve',
    apiName: apiName,
    method: method,
    request: null,
    responseFromMap: (json) => Response.fromJson(json),
  );
}

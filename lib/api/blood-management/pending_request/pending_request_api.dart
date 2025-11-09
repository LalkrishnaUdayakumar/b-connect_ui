import 'package:b_connect/api/api-utils/api_service.dart';
import 'package:b_connect/api/blood-management/pending_request/pending_request_response.dart';

const String apiName = 'getPendingRequests';
const String endpoint = '/request/pending';
const HttpMethod method = HttpMethod.get;

typedef Response = PendingRequestResponse;

Future<Response?> getPendingRequests() async {
  return await ApiService.apiCall<Response, void>(
    endpoint: endpoint,
    apiName: apiName,
    method: method,
    responseFromMap: (json) => Response.fromJson(json),
    // queryParams: {'param': 'value'}, // Optional for GET
  );
}

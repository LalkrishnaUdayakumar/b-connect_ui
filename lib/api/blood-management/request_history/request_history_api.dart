import 'package:b_connect/api/api-utils/api_service.dart';
import 'package:b_connect/api/blood-management/request_history/request_history_response.dart';

const String apiName = 'getRequestHistory';
const String endpoint = '/request/history';
const HttpMethod method = HttpMethod.get;

typedef Response = RequestHistoryResponse;

Future<Response?> getRequestHistory(String status) async {
  return await ApiService.apiCall<Response, void>(
    endpoint: endpoint,
    apiName: apiName,
    method: method,
    responseFromMap: (json) => Response.fromJson(json),
    queryParams: {'status': status}, // Optional for GET
  );
}

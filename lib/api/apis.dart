import 'package:b_connect/api/finddonors/finddonor_api.dart';
import 'package:b_connect/api/finddonors/finddonor_response.dart';
import 'package:b_connect/api/finddonors/finddonor_resquest.dart';

Future<FindDonorResponse?> addProductToCart(
    String bloodGroup, String bearerToken) async {
  FindDonorRequest request = FindDonorRequest(bloodGroup: bloodGroup);
  return await findDonor(request, bearerToken);
}

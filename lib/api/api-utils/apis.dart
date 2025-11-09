import 'package:b_connect/api/finddonors/finddonor_api.dart';
import 'package:b_connect/api/finddonors/finddonor_response.dart';
import 'package:b_connect/api/finddonors/finddonor_resquest.dart';
import 'package:b_connect/api/user-management/save_profile_image/save_profile_image_api.dart';
import 'package:b_connect/api/user-management/save_profile_image/save_profile_image_req.dart';
import 'package:b_connect/api/user-management/save_profile_image/save_profile_image_resp.dart';

Future<FindDonorResponse?> findDonors(
    String bloodGroup, String bearerToken) async {
  FindDonorRequest request = FindDonorRequest(bloodGroup: bloodGroup);
  return await findDonor(request, bearerToken);
}

Future<SaveProfileImageResponse?> saveUserProfilePhoto(
    String imageBytes, String bearerToken) async {
  SaveProfileImageRequest request =
      SaveProfileImageRequest(imageBytes: imageBytes);
  return await saveUserProfile(request, bearerToken);
}
